package shu.upms.model.dao.pm;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import shu.upms.model.entity.pm.Message;
import shu.upms.model.entity.rbac.User;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {

    @Query(value = "select m from Message m ORDER BY m.date DESC ")
    List<Message> findAllOrderByDate();

    Message findTopByReceiverOrderByDateDesc(User receiver);

    Page<Message> findBySender(User sender, Pageable pageable);

    @Query(value = "select m from Message m where m.receiver = ?1 OR m.receiver = null ORDER BY m.date DESC")
    List<Message> findByReceiver(User receiver);


    @Query(value = "select m from Message m where m.type IN ?1 AND m.title LIKE %?2% AND m.sender = ?3 AND ( m.receiver IN ( SELECT u FROM User u WHERE u.nick LIKE %?4% ) OR m.receiver = null ) ORDER BY m.date DESC")
    Page<Message> queryPMNick(int type, String title, User sender, String receiver, Pageable pageable);

    int countMessagesByReceiverAndSeen(User receiver, boolean seen);

}
