package com.werk.werk.entity;


import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.UUID;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor

public class User {
    
    public enum RateType {
        HOURLY,
        FIXED
    } 

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(updatable = false)
    private UUID id;

    @NotBlank
    @Column(nullable = false, length = 100)
    @Size(max = 100)
    private String name;

    @NotBlank
    @Email
    @Column(nullable = false, unique = true, length = 255)
    @Size(max = 255)
    private String email;

    @NotBlank
    @Column(name = "password_hash", nullable = false, length = 255)
    @Size(max = 255)
    private String passwordHash;

    @Column(columnDefinition = "TEXT")
    private String bio;

    @Column(columnDefinition = "TEXT")
    private String skills;

    @Enumerated(EnumType.STRING)
    @Column(name = "rate_type")
    private RateType rateType;

    @DecimalMin("0.0")
    @Column(name = "rate_amount", precision = 10, scale = 2)
    private BigDecimal rateAmount;

    @Column(name = "created_at", nullable = false, insertable = false, updatable = false)
    private OffsetDateTime createdAt;

}
