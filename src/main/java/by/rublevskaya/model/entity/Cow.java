package by.rublevskaya.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "cows")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cow {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "milk_per_day", nullable = false)
    private double milkPerDay;
}
