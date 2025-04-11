package by.rublevskaya.model.service;

import by.rublevskaya.model.entity.Cow;
import by.rublevskaya.model.entity.MilkRecord;
import by.rublevskaya.model.entity.Product;
import by.rublevskaya.model.repository.CowRepository;
import by.rublevskaya.model.repository.MilkRecordRepository;
import by.rublevskaya.model.repository.ProductRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class FarmService {
    private final MilkRecordRepository milkRecordRepository;
    private final ProductRepository productRepository;
    private final CowRepository cowRepository;

    @Autowired
    public FarmService(CowRepository cowRepository, MilkRecordRepository milkRecordRepository, ProductRepository productRepository) {
        this.cowRepository = cowRepository;
        this.milkRecordRepository = milkRecordRepository;
        this.productRepository = productRepository;
    }

    public double getAvailableMilk() {
        List<MilkRecord> milkRecords = milkRecordRepository.findAll();
        double totalMilk = milkRecords.stream().mapToDouble(MilkRecord::getMilkAmount).sum();
        double milkUsedForProducts = productRepository.findAll().stream()
                .mapToDouble(Product::getMilkUsed)
                .sum();
        return totalMilk - milkUsedForProducts;
    }

    public Product createProduct(String name, double milkUsed, int shelfLifeDays) {
        double availableMilk = getAvailableMilk();
        if (milkUsed > availableMilk) {
            throw new IllegalArgumentException("Недостаточно молока для производства продукта!");
        }
        Product product = new Product();
        product.setName(name);
        product.setMilkUsed(milkUsed);
        product.setShelfLifeDays(shelfLifeDays);
        return productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }


    public void addCow(Cow cow) {
        if (cow.getId() != null && cowRepository.existsById(cow.getId())) {
            throw new IllegalArgumentException("Корова с таким ID уже существует!");
        }
        cowRepository.save(cow);
        System.out.println("Добавлена корова: " + cow);
    }

    public void milkOneCow(Integer cowId) {
        Cow cow = cowRepository.findById(cowId)
                .orElseThrow(() -> new IllegalArgumentException("Корова с ID " + cowId + " не найдена!"));

        MilkRecord record = new MilkRecord();
        record.setCow(cow);
        record.setMilkedAt(LocalDateTime.now());
        record.setMilkAmount(cow.getMilkPerDay());
        milkRecordRepository.save(record);
    }

    public double milkAllCows() {
        List<Cow> cows = cowRepository.findAll();
        double totalMilk = 0;

        for (Cow cow : cows) {
            MilkRecord record = new MilkRecord();
            record.setCow(cow);
            record.setMilkedAt(LocalDateTime.now());
            record.setMilkAmount(cow.getMilkPerDay());
            milkRecordRepository.save(record);
            totalMilk += cow.getMilkPerDay();
        }

        return totalMilk;
    }

    public List<Cow> getCows() {
        return cowRepository.findAll();
    }
}