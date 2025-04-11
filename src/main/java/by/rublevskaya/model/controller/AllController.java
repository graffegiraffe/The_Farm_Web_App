package by.rublevskaya.model.controller;

import by.rublevskaya.model.service.FarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AllController {
    private static final Logger logger = LoggerFactory.getLogger(AllController.class);
    private final FarmService farmService;

    @Autowired
    public AllController(FarmService farmService) {
        this.farmService = farmService;
    }

    @GetMapping("/all")
    public String showAllCows(Model model) {
        logger.info("Запрошена страница со списком всех коров");
        model.addAttribute("cows", farmService.getCows());
        logger.debug("Список коров отправлен в модель");
        return "all";
    }
}