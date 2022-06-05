package com.magnet.web_photos.webphotos.repository;

import com.magnet.web_photos.webphotos.entity.FriendRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendRequestRepository extends JpaRepository<FriendRequest, Long> {
    @Query("select f from FriendRequest f where f.fromUser.id = :userId and f.toUser.id = :userId2 and f.isSent = true ")
    List<FriendRequest> getSentRequestsForSender(Long userId, Long userId2);

    @Query("select f from FriendRequest f where f.toUser.id = :userId2 and f.fromUser.id = :userId and f.isSent = true ")
    List<FriendRequest> getSentRequestsForReceiver(Long userId, Long userId2);

    @Query("select f from FriendRequest f where f.fromUser.id = :userId and f.toUser.id = :userId2 and f.isAccepted = false ")
    List<FriendRequest> getNotAcceptedFriendRequestsForSender(Long userId, Long userId2);

    @Query("select f from FriendRequest f where f.toUser.id = :userId2 and f.fromUser.id = :userId and f.isAccepted = false ")
    List<FriendRequest> getNotAcceptedFriendRequestsForReceiver(Long userId, Long userId2);

    @Query("select f from FriendRequest f where f.fromUser.id = :userId and f.isAccepted = false ")
    List<FriendRequest> getUsersFriendRequestsForSender(Long userId);

    @Query("select f from FriendRequest f where f.toUser.id = :userId and f.isAccepted = false ")
    List<FriendRequest> getUsersFriendRequestsForReceiver(Long userId);

    @Query("select f from FriendRequest f where f.toUser.id = :userId and f.isAccepted = true")
    List<FriendRequest> getUsersAcceptedFriendRequestsForReceiver(Long userId);

    @Query("select f from FriendRequest f where f.fromUser.id = :userId and f.isAccepted = true")
    List<FriendRequest> getUsersAcceptedFriendRequestsForSender(Long userId);
}
