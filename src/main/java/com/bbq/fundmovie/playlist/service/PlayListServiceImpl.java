package com.bbq.fundmovie.playlist.service;

import com.bbq.fundmovie.member.mapper.MemberSQLMapper;
import com.bbq.fundmovie.playlist.mapper.PlayListLikeSQLMapper;
import com.bbq.fundmovie.playlist.mapper.PlayListSQLMapper;
import com.bbq.fundmovie.vo.MFUserVo;
import com.bbq.fundmovie.vo.MemberVo;
import com.bbq.fundmovie.vo.PlayListLikeVo;
import com.bbq.fundmovie.vo.PlaylistVo;
import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class PlayListServiceImpl {
    @Autowired
    private PlayListLikeSQLMapper playListLikeSQLMapper;
    @Autowired
    private PlayListSQLMapper playListSQLMapper;
    @Autowired
    private MemberSQLMapper memberSQLMapper;

    public void writePlayList(PlaylistVo vo) {

        int PlayListVoPk = playListSQLMapper.createKey();

        vo.setPlaylist_no(PlayListVoPk);

        playListSQLMapper.writePlayList(vo);


    }

    public ArrayList<HashMap<String, Object>> getPlayList() {
        ArrayList<HashMap<String, Object>> resultPlayList = new ArrayList<HashMap<String, Object>>();

        ArrayList<PlaylistVo> playList = playListSQLMapper.selectAll();

        for (PlaylistVo playListVo : playList) {

            int user_no = playListVo.getUser_no();

            MemberVo memberVo = memberSQLMapper.selectByNo(user_no);

            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("MemberVo", memberVo);
            map.put("playListVo", playListVo);

            resultPlayList.add(map);

        }

        return resultPlayList;

    }

    public HashMap<String, Object> getPlayContent(int playListNo) {

        //playListSQLMapper.increaseReadCount(playListNo);

        PlaylistVo playListVo = playListSQLMapper.selectByPlayListNo(playListNo);

        String str = playListVo.getPlaylist_content();
        str = StringEscapeUtils.escapeHtml4(str);
        playListVo.setPlaylist_content(str);

        int user_no = playListVo.getUser_no();
        MemberVo memberVo = memberSQLMapper.selectByNo(user_no);

        //ArrayList<PlayListThumbNailVo> playListThumbNailVo = playListThumbNailSQLMapper.selectByPlayListNo(playListNo);

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("memberVo", memberVo);
        map.put("playListVo", playListVo);
        //map.put("playListThumbNailVo", playListThumbNailVo);

        return map;

    }

    public void deletePlayList(int playListNo) {
        playListSQLMapper.deletePlaylist(playListNo);
    }

    public void updatePlayList(PlaylistVo vo) {
        playListSQLMapper.updatePlaylist(vo);
    }

    public void insertPlayListLike(PlayListLikeVo vo) {

        playListLikeSQLMapper.inserPlayListLike(vo);
        playListLikeSQLMapper.updatePlayListLike(vo.getPlaylist_no());

    }

    public void deletePlayListLike(PlayListLikeVo vo) {
        playListLikeSQLMapper.deletePlayListLike(vo);
        playListLikeSQLMapper.updatePlayListLike(vo.getPlaylist_no());
    }

    public int getPlayList(PlayListLikeVo vo) {
        return playListLikeSQLMapper.getPlayList(vo);
    }


}
