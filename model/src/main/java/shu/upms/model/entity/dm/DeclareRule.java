package shu.upms.model.entity.dm;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import shu.upms.model.entity.rbac.User;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
public class DeclareRule {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private User publisher;

    private String title;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    private Date startTime;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    private Date endTime;

    private int major;

    @Column(columnDefinition="TEXT")
    private String ruleContent;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

}
