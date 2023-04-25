/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Infomation {

    private String roomName;
    private int electric;
    private int water;

    public Infomation() {
    }

    public Infomation(int electric, int water) {
        this.electric = electric;
        this.water = water;
    }

    public int getElectric() {
        return electric;
    }

    public void setElectric(int electric) {
        this.electric = electric;
    }

    public int getWater() {
        return water;
    }

    public void setWater(int water) {
        this.water = water;
    }

    public Infomation(String roomName, int electric, int water) {
        this.roomName = roomName;
        this.electric = electric;
        this.water = water;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

}
