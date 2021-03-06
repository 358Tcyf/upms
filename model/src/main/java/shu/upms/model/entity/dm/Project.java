package shu.upms.model.entity.dm;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import shu.upms.model.entity.rbac.User;

import javax.persistence.*;
import java.util.Date;
import java.util.List;


@Entity
@EntityListeners(AuditingEntityListener.class)
public class Project {
    @Id
    @GeneratedValue
    private Long id;

    private int level;

    private String name;

    @ManyToOne
    private User leader;

    @ManyToOne
    private User manager; //管理员

    @ManyToMany
    private List<User> experts; //分配的专家

    private String phone;

    private String email;

    private int major;  //学科

    private String members; //成员列表，以json数组格式存储

    @OneToMany
    private List<ProjectFile> commitmentPics;  //承诺书图片ID

    @OneToOne
    private ProjectFile declaration;    //申报书文件路径

    @OneToMany
    private List<ProjectFile> midCheckFiles;

    @OneToMany
    private List<ProjectFile> finalCheckFiles;

    @ManyToOne
    private DeclareRule entrance;   //申报入口

    /**
     * 状态码：-1-未提交；0-审核中；1-初审通过；2-初审未通过；3：立项评审中；4：立项评审完成；5：已立项；6：不立项；7：中期检查待整改；8：中期检查通过；9：结题验收待整改；10：已结题
     */
    private int state; //项目状态

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @CreatedDate
    private Date createTime;    //创建时间

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @LastModifiedDate
    private Date updateTime;    //更新时间

    private boolean submit;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getLeader() {
        return leader;
    }

    public void setLeader(User leader) {
        this.leader = leader;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMajor() {
        return major;
    }

    public void setMajor(int major) {
        this.major = major;
    }

    public String getMembers() {
        return members;
    }

    public void setMembers(String members) {
        this.members = members;
    }

    public List<ProjectFile> getCommitmentPics() {
        return commitmentPics;
    }

    public void setCommitmentPics(List<ProjectFile> commitmentPic) {
        this.commitmentPics = commitmentPic;
    }

    public ProjectFile getDeclaration() {
        return declaration;
    }

    public void setDeclaration(ProjectFile declaration) {
        this.declaration = declaration;
    }

    public DeclareRule getEntrance() {
        return entrance;
    }

    public void setEntrance(DeclareRule entrance) {
        this.entrance = entrance;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public List<User> getExperts() {
        return experts;
    }

    public void setExperts(List<User> experts) {
        this.experts = experts;
    }

    public boolean isSubmit() {
        return submit;
    }

    public void setSubmit(boolean submit) {
        this.submit = submit;
    }

    public List<ProjectFile> getMidCheckFiles() {
        return midCheckFiles;
    }

    public void setMidCheckFiles(List<ProjectFile> midCheckFiles) {
        this.midCheckFiles = midCheckFiles;
    }

    public List<ProjectFile> getFinalCheckFiles() {
        return finalCheckFiles;
    }

    public void setFinalCheckFiles(List<ProjectFile> finalCheckFiles) {
        this.finalCheckFiles = finalCheckFiles;
    }
}
