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
public class MilkController {
    private final FarmService farmService;

    private static final Logger logger = LoggerFactory.getLogger(MilkController.class);

    @Autowired
    public MilkController(FarmService farmService) {
        this.farmService = farmService;
    }

    @GetMapping("/milk")
    public String showAllCows(Model model) {
        try {
            logger.info("Запрошена страница списка всех коров для доения");
            model.addAttribute("cows", farmService.getCows());
            model.addAttribute("statusMessage", null);
            logger.info("Список коров успешно добавлен в модель");
        } catch (Exception e) {
            logger.error("Ошибка при получении списка коров: {}", e.getMessage(), e);
            model.addAttribute("statusMessage", "Ошибка при получении списка коров: " + e.getMessage());
        }
        return "milk";
    }

    @PostMapping("/milk/onecow")
    public String milkOneCow(@RequestParam("cowId") Integer cowId, Model model) {
        try {
            logger.info("Запрошен процесс дойки коровы с ID: {}", cowId);
            farmService.milkOneCow(cowId);
            model.addAttribute("statusMessage", "Корова с ID " + cowId + " успешно подоена!");
            logger.info("Корова с ID {} успешно подоена.", cowId);
        } catch (Exception e) {
            logger.error("Ошибка при доении коровы с ID {}: {}", cowId, e.getMessage(), e);
            model.addAttribute("statusMessage", "Ошибка: " + e.getMessage());
        }

        try {
            model.addAttribute("cows", farmService.getCows());
            logger.info("Список коров успешно обновлён после доения одной коровы");
        } catch (Exception e) {
            logger.error("Дополнительная ошибка при обновлении списка коров после доения: {}", e.getMessage(), e);
            model.addAttribute("statusMessage",
                    model.getAttribute("statusMessage") +
                            "\nДополнительная ошибка при обновлении списка коров: " + e.getMessage());
        }
        return "milk";
    }

    @PostMapping("/milk/allcows")
    public String milkAllCows(Model model) {
        try {
            logger.info("Запущен процесс массового доения всех коров");
            double totalMilk = farmService.milkAllCows();
            model.addAttribute("statusMessage", "Все коровы успешно подоены! Всего молока: " + totalMilk + " литров");
            logger.info("Все коровы успешно подоены. Собрано молока: {} литров", totalMilk);
        } catch (Exception e) {
            logger.error("Ошибка при массовом доении коров: {}", e.getMessage(), e);
            model.addAttribute("statusMessage", "Ошибка: " + e.getMessage());
        }

        try {
            model.addAttribute("cows", farmService.getCows());
            logger.info("Список коров успешно обновлён после массового доения");
        } catch (Exception e) {
            logger.error("Дополнительная ошибка при обновлении списка коров после массового доения: {}", e.getMessage(), e);
            model.addAttribute("statusMessage",
                    model.getAttribute("statusMessage") +
                            "\nДополнительная ошибка при обновлении списка коров: " + e.getMessage());

        }
        return "milk";
    }
}