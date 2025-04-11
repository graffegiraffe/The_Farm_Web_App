package by.rublevskaya.model.controller;

import by.rublevskaya.model.service.FarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
    private final FarmService farmService;

    @Autowired
    public ProductController(FarmService farmService) {
        this.farmService = farmService;
    }

    @GetMapping("/products")
    public String showProductsPage(Model model) {
        logger.info("Запрошена страница продуктов");
        try {
            model.addAttribute("products", farmService.getAllProducts());
            model.addAttribute("availableMilk", farmService.getAvailableMilk());
            logger.info("Список продуктов и доступное молоко успешно добавлены в модель");
        } catch (Exception e) {
            logger.error("Ошибка при загрузке страницы продуктов: {}", e.getMessage(), e);
            model.addAttribute("errorMessage", "Ошибка загрузки данных: " + e.getMessage());
        }
        return "products";
    }

    @PostMapping("/products/add")
    public String addProduct(@RequestParam("name") String name,
                             @RequestParam("milkUsed") double milkUsed,
                             @RequestParam("shelfLifeDays") int shelfLifeDays,
                             Model model) {
        logger.info("Обработка добавления нового продукта с параметрами: name={}, milkUsed={}, shelfLifeDays={}",
                name, milkUsed, shelfLifeDays);
        try {
            farmService.createProduct(name, milkUsed, shelfLifeDays);
            logger.info("Продукт успешно создан: name={}, milkUsed={}, shelfLifeDays={}", name, milkUsed, shelfLifeDays);
            model.addAttribute("successMessage", "Продукт успешно создан!");
        } catch (IllegalArgumentException e) {
            logger.error("Ошибка при создании продукта: {}", e.getMessage(), e);
            model.addAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/products";
    }
}