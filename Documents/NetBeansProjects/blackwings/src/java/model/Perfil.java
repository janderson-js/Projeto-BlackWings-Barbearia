package model;

import java.util.ArrayList;

public class Perfil {
    private int id;
    private String titulo;
    private String descricao;
    private ArrayList<Menu> meusMenus;

    public ArrayList<Menu> getMeusMenus() {
        return meusMenus;
    }

    public void setMeusMenus(ArrayList<Menu> meusMenus) {
        this.meusMenus = meusMenus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
