package ru.pis.lab4.dao;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import ru.pis.lab4.model.User;
import ru.pis.lab4.repo.UserRepo;

import static java.util.Objects.isNull;
import static org.springframework.util.StringUtils.hasText;


@Repository
@RequiredArgsConstructor
public class UserDao {
    private final UserRepo userRepo;

    public User getUserByUsername(String username) {
        if (!hasText(username)) {
            throw new IllegalArgumentException(("Username is empty"));
        }

        return userRepo.getByUsername(username);
    }

    public void addUser(User user) {
        if (isNull(user))
            throw new IllegalArgumentException("User is empty");

        userRepo.save(user);
    }

}
