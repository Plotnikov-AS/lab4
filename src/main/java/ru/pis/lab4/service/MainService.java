package ru.pis.lab4.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.pis.lab4.dao.EmployeeDao;
import ru.pis.lab4.model.Employee;

import java.util.List;

import static java.lang.Long.*;
import static java.lang.Long.valueOf;

@Service
@RequiredArgsConstructor
public class MainService {
    private final EmployeeDao employeeDao;

    public List<Employee> getAllEmployees() {
        return employeeDao.getAll();
    }

    public void editEmployee(String employeeId, String lastName, String firstMiddleName, String position, String address, String phone) {
        Employee employee = employeeDao.getEmployeeById(valueOf(employeeId));
        employee.setLastName(lastName);
        employee.setFirstMiddleName(firstMiddleName);
        employee.setPosition(position);
        employee.setAddress(address);
        employee.setPhone(phone);

        employeeDao.saveEmployee(employee);
    }

    public void deleteEmployee(String employeeId) {
        Employee employee = employeeDao.getEmployeeById(valueOf(employeeId));
        employeeDao.deleteEmployee(employee);
    }

    public void addNewEmployee(String lastName, String firstMiddleName, String position, String address, String phone) {
        Employee employee = new Employee();
        employee.setLastName(lastName);
        employee.setFirstMiddleName(firstMiddleName);
        employee.setPosition(position);
        employee.setAddress(address);
        employee.setPhone(phone);

        employeeDao.saveEmployee(employee);
    }
}
