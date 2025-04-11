package by.rublevskaya.model.controller;

import by.rublevskaya.model.entity.Product;
import by.rublevskaya.model.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class WarehouseController {
    private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/warehouse")
    public String showWarehouse(Model model) {
        logger.info("Запрошена страница со списком продуктов на складе");
        try {
            List<Product> products = productRepository.findAll();
            model.addAttribute("products", products);
            logger.info("Список продуктов успешно добавлен в модель.");
        } catch (Exception e) {
            logger.error("Ошибка при загрузке списка продуктов: {}", e.getMessage(), e);
            model.addAttribute("errorMessage", "Ошибка при загрузке продуктов: " + e.getMessage());
        }
        return "warehouse";
    }

    @GetMapping("/delete")
    public String showDeletePage(Model model) {
        logger.info("Запрошена страница удаления продуктов.");
        try {
            List<Product> products = productRepository.findAll();
            model.addAttribute("products", products);
            logger.info("Список продуктов для удаления успешно добавлен в модель");
        } catch (Exception e) {
            logger.error("Ошибка при загрузке продуктов для удаления: {}", e.getMessage(), e);
            model.addAttribute("errorMessage", "Ошибка при загрузке продуктов: " + e.getMessage());
        }
        return "delete";
    }

    @PostMapping("/delete")
    public String deleteProducts(@RequestParam(value = "productIds", required = false) List<Integer> productIds,
                                 RedirectAttributes redirectAttributes) {
        if (productIds == null || productIds.isEmpty()) {
            logger.warn("Попытка удалить продукты без выбора");
            redirectAttributes.addFlashAttribute("errorMessage", "Выберите хотя бы один продукт для удаления!");
            return "redirect:/delete";
        }

        try {
            logger.info("Попытка удаления продуктов с ID: {}", productIds);
            productRepository.deleteAllById(productIds);
            redirectAttributes.addFlashAttribute("successMessage", "Выбранные продукты успешно удалены!");
            logger.info("Продукты с ID {} успешно удалены.", productIds);
        } catch (Exception e) {
            logger.error("Ошибка при удалении продуктов с ID {}: {}", productIds, e.getMessage(), e);
            redirectAttributes.addFlashAttribute("errorMessage", "Ошибка при удалении: " + e.getMessage());
        }
        return "redirect:/delete";
    }

}