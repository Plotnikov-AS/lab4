package ru.pis.lab4.dao;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import ru.pis.lab4.model.Employee;
import ru.pis.lab4.repo.EmployeeRepo;

import java.util.List;

import static java.util.Objects.isNull;
import static org.springframework.util.StringUtils.hasText;

@Repository
@RequiredArgsConstructor
public class EmployeeDao {
    private final EmployeeRepo employeeRepo;

    public Employee getEmployeeById(Long id) {
        if (isNull(id)) {
            throw new IllegalArgumentException("Id is empty");
        }

        return employeeRepo.getById(id);
    }

    public List<Employee> getEmployeeByLastName(String lastName) {
        if (!hasText(lastName)) {
            throw new IllegalArgumentException("Last name is empty");
        }

        return employeeRepo.getByLastName(lastName);
    }

    public List<Employee> getAll() {
        return employeeRepo.getAll();
    }
}
