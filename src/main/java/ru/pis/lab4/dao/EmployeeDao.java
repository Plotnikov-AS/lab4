package ru.pis.lab4.dao;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import ru.pis.lab4.model.Employee;
import ru.pis.lab4.repo.EmployeeRepo;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

import static java.util.Objects.isNull;

@Repository
@Transactional
@RequiredArgsConstructor
public class EmployeeDao {
    private final EmployeeRepo employeeRepo;
    @PersistenceContext
    private final EntityManager entityManager;

    public Employee getEmployeeById(Long id) {
        if (isNull(id)) {
            throw new IllegalArgumentException("Employee Id is empty");
        }

        return employeeRepo.getById(id);
    }

    public List<Employee> getAll() {
        return employeeRepo.getAll();
    }

    public void saveEmployee(Employee employee) {
        if (isNull(employee)) {
            throw new IllegalArgumentException("Employee is empty");
        }

        entityManager.persist(employee);
    }

    public void deleteEmployee(Employee employee) {
        if (isNull(employee)) {
            throw new IllegalArgumentException("Employee is empty");
        }

        entityManager.remove(employee);
    }
}
