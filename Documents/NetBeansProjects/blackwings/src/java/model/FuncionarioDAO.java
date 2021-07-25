package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FuncionarioDAO extends DataBase {

    public ArrayList<Funcionario> listar() throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario WHERE status!='Admin' AND status='Ativo'";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            PerfilDAO pDAO = new PerfilDAO();
            f.setId(rs.getInt("id"));
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perf")));
            f.setNome(rs.getString("nome"));
            f.setMatricula(rs.getString("matricula"));
            f.setSenha(rs.getString("senha"));
            f.setStatus(rs.getString("status"));
            f.setTelefoneContato(rs.getString("telefone_contato"));
            f.setTelefone(rs.getString("telefone"));
            f.setCep(rs.getString("cep"));
            f.setCidade(rs.getString("cidade"));
            f.setBairro(rs.getString("bairro"));
            f.setEndereco(rs.getString("endereco"));
            f.setCasa(rs.getString("casa"));
            f.setDataNascimento(rs.getTimestamp("data_nascimento"));
            f.setDataContrato(rs.getTimestamp("data_contrato"));
            f.setDataFinalContrato(rs.getTimestamp("data_final_contrato"));
            f.setDataSaida(rs.getTimestamp("data_saida"));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Funcionario> listarInativo() throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario WHERE status!='Admin' AND status='Inativo'";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            PerfilDAO pDAO = new PerfilDAO();
            f.setId(rs.getInt("id"));
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perf")));
            f.setNome(rs.getString("nome"));
            f.setMatricula(rs.getString("matricula"));
            f.setSenha(rs.getString("senha"));
            f.setStatus(rs.getString("status"));
            f.setTelefoneContato(rs.getString("telefone_contato"));
            f.setTelefone(rs.getString("telefone"));
            f.setCep(rs.getString("cep"));
            f.setCidade(rs.getString("cidade"));
            f.setBairro(rs.getString("bairro"));
            f.setEndereco(rs.getString("endereco"));
            f.setCasa(rs.getString("casa"));
            f.setDataNascimento(rs.getTimestamp("data_nascimento"));
            f.setDataContrato(rs.getTimestamp("data_contrato"));
            f.setDataFinalContrato(rs.getTimestamp("data_final_contrato"));
            f.setDataSaida(rs.getTimestamp("data_saida"));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Funcionario> buscarFuncionario(String matricula) throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario WHERE matricula=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, matricula);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            PerfilDAO pDAO = new PerfilDAO();
            f.setId(rs.getInt("id"));
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perf")));
            f.setNome(rs.getString("nome"));
            f.setMatricula(rs.getString("matricula"));
            f.setSenha(rs.getString("senha"));
            f.setStatus(rs.getString("status"));
            f.setTelefoneContato(rs.getString("telefone_contato"));
            f.setTelefone(rs.getString("telefone"));
            f.setCep(rs.getString("cep"));
            f.setCidade(rs.getString("cidade"));
            f.setBairro(rs.getString("bairro"));
            f.setEndereco(rs.getString("endereco"));
            f.setCasa(rs.getString("casa"));
            f.setDataNascimento(rs.getTimestamp("data_nascimento"));
            f.setDataContrato(rs.getTimestamp("data_contrato"));
            f.setDataFinalContrato(rs.getTimestamp("data_final_contrato"));
            f.setDataSaida(rs.getTimestamp("data_saida"));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }

    public void inserirFuncionario(Funcionario f) throws Exception {
        String sql = "INSERT INTO funcionario (id_perf,nome,data_nascimento,telefone_contato, telefone,matricula, senha,cep, cidade, bairro, endereco, casa, data_contrato, data_final_contrato) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, f.getPerfil().getId());
        pstm.setString(2, f.getNome());
        pstm.setTimestamp(3, f.getDataNascimento());
        pstm.setString(4, f.getTelefoneContato());
        pstm.setString(5, f.getTelefone());
        pstm.setString(6, f.getMatricula());
        pstm.setString(7, f.getSenha());
        pstm.setString(8, f.getCep());
        pstm.setString(9, f.getCidade());
        pstm.setString(10, f.getBairro());
        pstm.setString(11, f.getEndereco());
        pstm.setString(12, f.getCasa());
        pstm.setTimestamp(13, f.getDataContrato());
        pstm.setTimestamp(14, f.getDataFinalContrato());

        pstm.execute();
        this.desconectar();
    }

    public void alterarAdmin(Funcionario f) throws Exception {
        String sql = "UPDATE funcionario SET nome=?,matricula=?, senha=?  WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getMatricula());
        pstm.setString(3, f.getSenha());
        pstm.setInt(4, f.getId());
        pstm.execute();
        this.desconectar();
    }

    public void alterarStatus(Funcionario f) throws Exception {
        String sql = "UPDATE funcionario SET status=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getStatus());
        pstm.setInt(2, f.getId());
        pstm.execute();
        this.desconectar();
    }

    public void alterarFuncionario(Funcionario f) throws Exception {
        String sql = "UPDATE funcionario SET nome=?, data_nascimento=?,telefone_contato=?,telefone=?,matricula=?, senha=?,cep=?, cidade=?, bairro=?, endereco=?, casa=?, data_contrato=?,data_final_contrato=? WHERE id=? AND status='Ativo'";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setTimestamp(2, f.getDataNascimento());
        pstm.setString(3, f.getTelefoneContato());
        pstm.setString(4, f.getTelefone());
        pstm.setString(5, f.getMatricula());
        pstm.setString(6, f.getSenha());
        pstm.setString(7, f.getCep());
        pstm.setString(8, f.getCidade());
        pstm.setString(9, f.getBairro());
        pstm.setString(10, f.getEndereco());
        pstm.setString(11, f.getCasa());
        pstm.setTimestamp(12, f.getDataContrato());
        pstm.setTimestamp(13, f.getDataFinalContrato());
        pstm.setInt(14, f.getId());
        pstm.execute();
        this.desconectar();
    }

    public void excluirFuncionario(int id) throws Exception {
        String sql = "DELETE FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void excluirFuncionarioServico(int id) throws Exception {
        String sql = "DELETE FROM funcionario_servico WHERE id_servico=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Funcionario carregarPorId(int id) throws Exception {
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        PerfilDAO pDAO = new PerfilDAO();
        if (rs.next()) {
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perf")));
            f.setDataNascimento(rs.getTimestamp("data_nascimento"));
            f.setTelefone(rs.getString("telefone"));
            f.setTelefoneContato(rs.getString("telefone_contato"));
            f.setMatricula(rs.getString("matricula"));
            f.setSenha(rs.getString("senha"));
            f.setCep(rs.getString("cep"));
            f.setCidade(rs.getString("cidade"));
            f.setBairro(rs.getString("bairro"));
            f.setEndereco(rs.getString("endereco"));
            f.setCasa(rs.getString("casa"));
            f.setDataContrato(rs.getTimestamp("data_contrato"));
            f.setDataFinalContrato(rs.getTimestamp("data_final_contrato"));
            f.setDataSaida(rs.getTimestamp("data_saida"));
            f.setMeusServicos(this.listarServicoFuncionario(id));
        }
        this.desconectar();

        return f;

    }

    public Funcionario logar(String login, String senha) throws Exception {
        Funcionario f = new Funcionario();
        String sql = "SELECT * FROM funcionario WHERE matricula=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setMatricula(rs.getString("matricula"));
                f.setSenha(rs.getString("senha"));
                f.setStatus(rs.getString("status"));
                PerfilDAO pDAO = new PerfilDAO();
                f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perf")));
            }
        }
        this.desconectar();
        return f;
    }

    public void vincularServico(int idFuncionario, int idServico) throws Exception {
        String sql = "INSERT INTO funcionario_servico (id_funcionario,id_servico) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idFuncionario);
        pstm.setInt(2, idServico);
        pstm.execute();
        this.desconectar();
    }

    public void desvincularServico(int idFuncionario, int idServico) throws Exception {
        String sql = "DELETE FROM funcionario_servico WHERE id_funcionario=? AND id_servico=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idFuncionario);
        pstm.setInt(2, idServico);
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Servico> listarServicoFuncionario(int idFuncionario) throws Exception {
        ArrayList<Servico> lista = new ArrayList<Servico>();
        String sql = "SELECT m.* FROM servico as m, funcionario_servico as pm WHERE m.id=pm.id_servico AND pm.id_funcionario=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idFuncionario);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Servico s = new Servico();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setTipo(rs.getString("tipo"));
            s.setValor(rs.getDouble("valor"));
            lista.add(s);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Servico> listarServicoNaoFuncionario(int idFuncionario) throws Exception {
        ArrayList<Servico> lista = new ArrayList<Servico>();
        String sql = "SELECT * FROM servico "
                + "WHERE id NOT IN(SELECT pm.id_servico FROM funcionario_servico as pm WHERE pm.id_funcionario=?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idFuncionario);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Servico s = new Servico();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setTipo(rs.getString("tipo"));
            s.setValor(rs.getDouble("valor"));
            lista.add(s);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Funcionario> funcionarioServico(int idServico) throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario WHERE id IN(SELECT f.id_funcionario FROM funcionario_servico as f WHERE f.id_servico=?)  AND status='Ativo'";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idServico);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> funcionarioServicoAguardando(int idFun) throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM `atendimento` WHERE id_funcionario=? AND status='aguardando' AND data=CURDATE() ORDER BY id ASC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idFun);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Atendimento a = new Atendimento();
            ClienteDAO cDAO = new ClienteDAO();
            FuncionarioDAO fDAO = new FuncionarioDAO();
            ServicoDAO sDAO = new ServicoDAO();
            a.setId(rs.getInt("id"));
            a.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            a.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            a.setServico(sDAO.carregarPorId(rs.getInt("id_servico")));
            a.setDataAgendamento(rs.getTimestamp("data"));
            a.setHoraAgendamento(rs.getTimestamp("hora"));
            a.setValorAgendamento(rs.getDouble("valor"));
            a.setFormaPagamento(rs.getString("forma_pagamento"));
            a.setStatusAgendamento(rs.getString("status"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> funcionarioServicoAgendado(int idFun) throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM `atendimento` WHERE id_funcionario=? AND status='aguardando' AND data!=CURDATE() ORDER BY id ASC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idFun);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Atendimento a = new Atendimento();
            ClienteDAO cDAO = new ClienteDAO();
            FuncionarioDAO fDAO = new FuncionarioDAO();
            ServicoDAO sDAO = new ServicoDAO();
            a.setId(rs.getInt("id"));
            a.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            a.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            a.setServico(sDAO.carregarPorId(rs.getInt("id_servico")));
            a.setDataAgendamento(rs.getTimestamp("data"));
            a.setHoraAgendamento(rs.getTimestamp("hora"));
            a.setValorAgendamento(rs.getDouble("valor"));
            a.setFormaPagamento(rs.getString("forma_pagamento"));
            a.setStatusAgendamento(rs.getString("status"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public void confirmarServico(int id) throws Exception {
        String sql = "UPDATE atendimento SET status='Realizado' WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
}
