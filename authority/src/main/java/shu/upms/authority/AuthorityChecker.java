package shu.upms.authority;

public interface AuthorityChecker {
    String[] getPermissionByRole(String role);

    String getRoleByUser(String user);

    boolean checkPrincipal(Subject subject);
}
