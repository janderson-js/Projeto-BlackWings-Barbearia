package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PerfilDAO extends DataBase {

    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setTitulo(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }

    public void inserirPerfil(Perfil p) throws Exception {
        String sql = "INSERT INTO perfil (nome,descricao) VALUES (?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getTitulo());
        pstm.setString(2, p.getDescricao());
        pstm.execute();
        this.desconectar();
    }

    public void alterarPerfil(Perfil p) throws Exception {
        String sql = "UPDATE perfil SET nome=?, descricao=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getTitulo());
        pstm.setString(2, p.getDescricao());
        pstm.setInt(3, p.getId());
        pstm.execute();
        this.desconectar();
    }

    public void excluirPerfil(int id) throws Exception {
        String sql = "DELETE FROM perfil WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public void excluirPerfilMenu(int id) throws Exception {
        String sql = "DELETE FROM perfil_menu WHERE id_perfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Perfil carregarPorId(int id) throws Exception {
        Perfil p = new Perfil();
        String sql = "SELECT * FROM perfil WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setTitulo(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setMeusMenus(this.listarMenusPerfil(id));
        }
        this.desconectar();

        return p;

    }

    public void vincularMenu(int id_perfil, int id_menu) throws Exception {
        String sql = "INSERT INTO perfil_menu (id_perfil,id_menu) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        pstm.setInt(2, id_menu);
        pstm.execute();
        this.desconectar();
    }

    public void desvincularMenu(int id_perfil, int id_menu) throws Exception {
        String sql = "DELETE FROM perfil_menu WHERE id_perfil=? AND id_menu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        pstm.setInt(2, id_menu);
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Menu> listarMenusPerfil(int id_perfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu as m, perfil_menu as pm WHERE m.id=pm.id_menu AND pm.id_perfil=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Menu> listarMenusNaoPerfil(int id_perfil) throws Exception {
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu "
                + "WHERE id NOT IN(SELECT pm.id_menu FROM perfil_menu as pm WHERE pm.id_perfil=?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
}
