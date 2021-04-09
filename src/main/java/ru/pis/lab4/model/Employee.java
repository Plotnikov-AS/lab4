package ru.pis.lab4.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "table_employee", schema = "lab4_schema")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "first_middle_name")
    private String firstMiddleName;

    private String position;
    private String address;
    private String phone;
}
