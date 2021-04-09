package ru.pis.lab4.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.pis.lab4.dao.UserDao;
import ru.pis.lab4.model.User;

import static java.util.Collections.singletonList;
import static java.util.Objects.nonNull;
import static ru.pis.lab4.model.Role.parseRole;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {
    private final UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userDao.getUserByUsername(username);
    }

    public boolean addUser(User user, String role) {
        User userFromDB = userDao.getUserByUsername(user.getUsername());
        if (nonNull(userFromDB)) {
            return false;
        }

        user.setRoles(singletonList(parseRole(role)));
        userDao.addUser(user);
        return true;
    }
}
