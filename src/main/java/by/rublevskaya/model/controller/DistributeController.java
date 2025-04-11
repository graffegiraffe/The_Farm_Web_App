package by.rublevskaya.model.controller;

import by.rublevskaya.model.entity.Distribution;
import by.rublevskaya.model.entity.Product;
import by.rublevskaya.model.repository.DistributionRepository;
import by.rublevskaya.model.repository.ProductRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class DistributeController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private DistributionRepository distributionRepository;

    private static final Logger logger = LoggerFactory.getLogger(DistributeController.class);

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm");

    @GetMapping("/distribute")
    public String getDistributePage(Model model) {
        logger.info("Открыта страница распределения товаров");
        List<Product> products = productRepository.findAll();
        List<Distribution> distributions = distributionRepository.findAll();
        distributions.forEach(distribution -> {
            distribution.setDistributedAtFormatted(distribution.getDistributedAt().format(formatter));
        });
        model.addAttribute("products", products);
        model.addAttribute("distributions", distributions);
        return "distribute";
    }

    @Transactional
    @PostMapping("/distribute")
    public String distributeProduct(
            @RequestParam String consumerName,
            @RequestParam Integer productId,
            RedirectAttributes redirectAttributes) {
        try {
            Product product = productRepository.findById(productId)
                    .orElseThrow(() -> new IllegalArgumentException("Продукт не найден по ID: " + productId));

            Distribution distribution = new Distribution();
            distribution.setConsumerName(consumerName);
            distribution.setProduct(product);

            distributionRepository.save(distribution);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Продукт '" + product.getName() + "' успешно распределён потребителю " + consumerName);
            logger.info("Попытка распределения продукта: consumerName={}, productId={}", consumerName, productId);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Ошибка при распределении: " + e.getMessage());
        }
        return "redirect:/distribute";
    }
}