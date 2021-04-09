package ru.pis.lab4.model;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ADMIN,
    DIRECTOR,
    SEMI_DIRECTOR,
    SECRETARY,
    GUEST;

    @Override
    public String getAuthority() {
        return name();
    }

    public static Role parseRole(String roleStr) {
        if (ADMIN.equals(roleStr)) {
            return ADMIN;
        } else if (DIRECTOR.equals(roleStr)) {
            return DIRECTOR;
        } else if (SEMI_DIRECTOR.equals(roleStr)) {
            return SEMI_DIRECTOR;
        } else if (SECRETARY.equals(roleStr)) {
            return SECRETARY;
        } else if (GUEST.equals(roleStr)) {
            return GUEST;
        }

        throw new RuntimeException("Can't parse role from " + roleStr);
    }

    public boolean equals(String roleStr) {
        return this.name().equalsIgnoreCase(roleStr);
    }
}
