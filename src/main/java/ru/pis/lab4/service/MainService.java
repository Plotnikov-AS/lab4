package ru.pis.lab4.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.pis.lab4.dao.EmployeeDao;
import ru.pis.lab4.model.Employee;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainService {
    private final EmployeeDao employeeDao;

    public List<Employee> getAllEmployees() {
        return employeeDao.getAll();
    }
}
