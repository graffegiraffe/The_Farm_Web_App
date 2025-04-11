package by.rublevskaya.model.repository;

import by.rublevskaya.model.entity.MilkRecord;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MilkRecordRepository extends JpaRepository<MilkRecord, Integer> {
}