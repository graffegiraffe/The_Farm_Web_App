package by.rublevskaya.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
    private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @GetMapping("/menu")
    public String continuePage() {
        logger.info("Запрошена страница меню");
        return "menu";
    }

    @GetMapping("/dance")
    public String dancePage() {
        logger.info("Запрошена страница с танцами");
        return "dance";
    }
}