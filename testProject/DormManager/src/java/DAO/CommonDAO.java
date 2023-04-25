/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Dom;
import Model.Infomation;
import Model.Room;
import Model.RoomType;
import Model.Term;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommonDAO extends DBConnect {

    ResultSet rs;
    PreparedStatement ps;

    public List<Dom> getListDom() {
        String sql = "select * from Dom";
        List<Dom> ls = new ArrayList<>();
        try {
            rs = getData(sql);
            while (rs.next()) {
                ls.add(new Dom(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return ls;
    }

    public List<Term> getListTerm() {
        String sql = "select * from Term";
        List<Term> ls = new ArrayList<>();
        try {
            rs = getData(sql);
            while (rs.next()) {
                ls.add(new Term(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return ls;
    }

    public List<RoomType> getListRoomType() {
        String sql = "select * from RoomType";
        List<RoomType> ls = new ArrayList<>();
        try {
            rs = getData(sql);
            while (rs.next()) {
                ls.add(new RoomType(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));
            }
        } catch (Exception e) {
        }
        return ls;
    }

    public RoomType getRoomTypeById(int id) {
        String sql = "select * from RoomType where typeId=" + id;

        try {
            rs = getData(sql);
            if (rs.next()) {
                return new RoomType(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Infomation getInfomation(int aid, int termid) {
        String sql = "select r.roomCode,electricUsage,waterUsage from Infomation i join AccountRoom a on a.roomId = i.roomId join Room r on r.roomId=i.roomId where accountId = ? and i.termId = ? ";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, aid);
            ps.setInt(2, termid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Infomation(rs.getString(1), rs.getInt(2), rs.getInt(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Room> getListRoomFree(int typeid, int domid, int floor) {
        String sql = "SELECT * from Room where domId=" + domid + " and floor=" + floor + " and status =1" + " and typeId =" + typeid;
        List<Room> ls = new ArrayList<>();
        try {
            rs = getData(sql);
            while (rs.next()) {
                ls.add(new Room(rs.getInt(1), rs.getString(2)));
            }
            return ls;
        } catch (Exception e) {
        }
        return new ArrayList<>();
    }

    public boolean insertAccountRoom(int aid, int rid, int tid) {
        String sql = "INSERT INTO [dbo].[AccountRoom]([accountId],[roomId],[termId])\n"
                + " VALUES(?,?,?)";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, aid);
            ps.setInt(2, rid);
            ps.setInt(3, tid);

            if (ps.executeUpdate() == 1) {
                sql = "update Account set balance = balance-(select price from Room r join RoomType rt on r.typeId = rt.typeId where roomId=?) \n"
                        + "where accountId =?;"
                        + "UPDATE [dbo].[Room] SET freeBed = freeBed-1 where roomId=?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, rid);
                ps.setInt(3, rid);
                ps.setInt(2, aid);
                return ps.executeUpdate() == 1;
            }

            return false;
        } catch (Exception e) {
            return false;
        }
    }
}
