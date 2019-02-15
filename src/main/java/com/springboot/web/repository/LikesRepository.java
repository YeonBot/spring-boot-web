package com.springboot.web.repository;

import com.springboot.web.domain.Likes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface LikesRepository extends JpaRepository<Likes,Integer> {

    @Query("select l from Likes l where l.boardId = :boardId and l.userId = :userId")
    Likes findAllByBoardIdAndUserId(@Param("boardId") int boardId,@Param("userId") int userId);

    @Transactional
    int deleteByBoardIdAndUserId(int boardId,int userId);
}
