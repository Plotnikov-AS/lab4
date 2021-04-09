package ru.pis.lab4.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.pis.lab4.model.User;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    User getByUsername(String username);
}
