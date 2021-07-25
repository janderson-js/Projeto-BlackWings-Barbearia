package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO extends DataBase {

    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente WHERE status='Ativo' ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));
            c.setTelefoneContato(rs.getString("telefone_contato"));
            c.setTelefone(rs.getString("telefone"));
            c.setTermos(rs.getString("termos"));
            c.setDataCadastro(rs.getTimestamp("data_cadastro"));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
     public ArrayList<Cliente> listarInativo() throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente WHERE status='Inativo'";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));
            c.setTelefoneContato(rs.getString("telefone_contato"));
            c.setTelefone(rs.getString("telefone"));
            c.setTermos(rs.getString("termos"));
            c.setDataCadastro(rs.getTimestamp("data_cadastro"));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
     public ArrayList<Cliente> buscarCliente(String cpf) throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente WHERE cpf=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpf);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));
            c.setTelefoneContato(rs.getString("telefone_contato"));
            c.setTelefone(rs.getString("telefone"));
            c.setTermos(rs.getString("termos"));
            c.setDataCadastro(rs.getTimestamp("data_cadastro"));
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }
    public void inserirCliente(Cliente c) throws Exception {
        String sql = "INSERT INTO cliente (nome, cpf, senha, telefone_contato, telefone, termos, data_cadastro) VALUES (?,?,?,?,?,?,now())";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getCpf());
        pstm.setString(3, c.getSenha());
        pstm.setString(4, c.getTelefoneContato());
        pstm.setString(5, c.getTelefone());
        pstm.setString(6, c.getTermos());
        pstm.execute();
        this.desconectar();
    }
    public void alterarStatus(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET status=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getStatus());
        pstm.setInt(2, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public void alterarCliente(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET nome=?, cpf=?, senha=?, telefone_contato=?, telefone=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getCpf());
        pstm.setString(3, c.getSenha());
        pstm.setString(4, c.getTelefoneContato());
        pstm.setString(5, c.getTelefone());
        pstm.setInt(6, c.getId());
        pstm.execute();
        this.desconectar();
    }

    public void excluirCliente(int id) throws Exception {
        String sql = "DELETE FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Cliente carregarPorId(int id) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            c.setSenha(rs.getString("senha"));
            c.setStatus(rs.getString("status"));
            c.setTelefoneContato(rs.getString("telefone_contato"));
            c.setTelefone(rs.getString("telefone"));
            c.setTermos(rs.getString("termos"));
            c.setDataCadastro(rs.getTimestamp("data_cadastro"));
        }
        this.desconectar();

        return c;
    }

    public Cliente logar(String login, String senha) throws Exception {
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE cpf=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setCpf(rs.getString("cpf"));
                c.setSenha(rs.getString("senha"));
                c.setTelefone(rs.getString("telefone"));
                c.setTelefoneContato(rs.getString("telefone_contato"));
                c.setStatus(rs.getString("status"));
            }
        }
        this.desconectar();
        return c;
    }
}
