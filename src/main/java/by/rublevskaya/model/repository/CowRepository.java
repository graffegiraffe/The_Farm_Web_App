package by.rublevskaya.model.repository;

import by.rublevskaya.model.entity.Cow;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CowRepository extends JpaRepository<Cow, Integer> {
}