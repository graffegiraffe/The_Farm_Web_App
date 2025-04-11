package by.rublevskaya.model.controller;

import by.rublevskaya.model.entity.Cow;
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
public class AddController {
    private static final Logger logger = LoggerFactory.getLogger(AddController.class);
    private final FarmService farmService;

    @Autowired
    public AddController(FarmService farmService) {
        this.farmService = farmService;
    }

    @GetMapping("/add")
    public String showAddCowPage() {
        logger.info("Открыта страница добавления коровы");
        return "add";
    }

    @PostMapping("/add")
    public String addCow(@RequestParam("cowMilk") double milkPerDay, Model model) {
        logger.info("Обрабатываем запрос на добавление коровы. Получено значение milkPerDay: {}", milkPerDay);
        Cow newCow = new Cow(null, milkPerDay);
        farmService.addCow(newCow);
        logger.info("Добавлена корова: {}", newCow);
        model.addAttribute("message", "Корова успешно добавлена!");
        return "redirect:/menu";
    }
}