package shu.upms.authority.matcher;

import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import shu.upms.authority.PatternMatcher;


public class SpringPatternMatcher implements PatternMatcher {
    private PathMatcher antPathMatcher;

    public SpringPatternMatcher() {
        antPathMatcher = new AntPathMatcher();
    }

    @Override
    public boolean match(String url, String path) {
        return antPathMatcher.match(path, url);
    }
}
