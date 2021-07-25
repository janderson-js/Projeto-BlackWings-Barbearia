package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MenuDAO extends DataBase{
     public ArrayList<Menu> listar() throws Exception{
        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }
        this.desconectar(); 
        return lista;
    }
    public void inserirMenu(Menu m) throws Exception{
        String sql = "INSERT INTO menu (titulo,link) VALUES (?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getNome());
        pstm.setString(2, m.getLink());
        pstm.execute();
        this.desconectar();  
    }
    public void alterarMenu(Menu m) throws Exception{
        String sql = "UPDATE menu SET titulo=?, link=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getNome());
        pstm.setString(2, m.getLink());
        pstm.setInt(3, m.getId());
        pstm.execute();
        this.desconectar();
    }
    public void excluirMenu(int id) throws Exception{
        String sql = "DELETE FROM menu WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
   public void excluirPerfilMenu(int id) throws Exception {
        String sql = "DELETE FROM perfil_menu WHERE id_menu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    public Menu carregarPorId(int id) throws Exception{
        Menu m = new Menu();
        String sql = "SELECT * FROM menu WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
        }
        this.desconectar();
        
        return m;
        
    }
}
