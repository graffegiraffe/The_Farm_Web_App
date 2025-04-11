package by.rublevskaya.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "milk_records")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MilkRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cow_id", nullable = false)
    private Cow cow;

    @Column(name = "milked_at", nullable = false)
    private LocalDateTime milkedAt;

    @Column(name = "milk_amount", nullable = false)
    private double milkAmount;
}