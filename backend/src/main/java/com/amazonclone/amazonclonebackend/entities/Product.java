package com.amazonclone.amazonclonebackend.entities;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@EqualsAndHashCode
@ToString
@Entity
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, updatable = false)
    private long id;
    private String name;
    private String description;
    private float price;
    @Column(name = "barcode", nullable = false, updatable = false)
    private String barcode;
    private String imageUrl;
    private int ratings;
}
