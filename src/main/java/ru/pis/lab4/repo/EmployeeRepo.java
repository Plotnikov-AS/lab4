package ru.pis.lab4.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ru.pis.lab4.model.Employee;

import java.util.List;

@Repository
public interface EmployeeRepo extends JpaRepository<Employee, Long> {
    Employee getById(Long id);

    List<Employee> getByLastName(String lastName);

    @Query("SELECT emp " +
            "FROM Employee emp")
    List<Employee> getAll();
}
