package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AtendimentoDAO extends DataBase {

    public ArrayList<Atendimento> listar() throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> listarMeusAgendamentos(int id) throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento WHERE id_cliente=? ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> listarAgendamentoAguardando() throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento WHERE status ='Aguardando' ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> buscarAgendamentoCliente(String cpf) throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento WHERE id_cliente IN(SELECT id FROM cliente c WHERE c.cpf=?) ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, cpf);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> listarServicoRealizado() throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento WHERE status='Realizado' ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> listarAgendamentoCancelado() throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento WHERE status='Cancelado' ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Atendimento> listatAgendamentoPago() throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento WHERE status='Pago' ORDER BY id DESC";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
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
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro_agendamento"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public void inserirAtendimento(Atendimento a) throws Exception {
        String sql = "INSERT INTO atendimento (id_cliente, id_funcionario, id_servico, data, hora, valor, forma_pagamento,data_registro_agendamento) VALUES (?,?,?,?,?,?,?,now())";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, a.getCliente().getId());
        pstm.setInt(2, a.getFuncionario().getId());
        pstm.setInt(3, a.getServico().getId());
        pstm.setTimestamp(4, a.getDataAgendamento());
        pstm.setTimestamp(5, a.getHoraAgendamento());
        pstm.setDouble(6, a.getValorAgendamento());
        pstm.setString(7, a.getFormaPagamento());
        pstm.execute();
        this.desconectar();
    }

    public void excluirAtendimento(int id) throws Exception {
        String sql = "DELETE FROM atendimento WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
     public void excluirAtendimentoFun(int id) throws Exception {
        String sql = "DELETE FROM atendimento WHERE id_funcionario=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
     public void excluirAtendimentoCli(int id) throws Exception {
        String sql = "DELETE FROM atendimento WHERE id_cliente=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
     public void excluirAtendimentoServ(int id) throws Exception {
        String sql = "DELETE FROM atendimento WHERE id_servico=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Atendimento carregarPorId(int id) throws Exception {
        Atendimento a = new Atendimento();
        String sql = "SELECT * FROM atendimento WHERE id=?";
        ClienteDAO cDAO = new ClienteDAO();
        FuncionarioDAO fDAO = new FuncionarioDAO();
        ServicoDAO sDAO = new ServicoDAO();
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            a.setId(rs.getInt("id"));
            a.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            a.setFuncionario(fDAO.carregarPorId(rs.getInt("id_funcionario")));
            a.setServico(sDAO.carregarPorId(rs.getInt("id_servico")));
            a.setDataAgendamento(rs.getTimestamp("data"));
            a.setHoraAgendamento(rs.getTimestamp("hora"));
            a.setValorAgendamento(rs.getDouble("valor"));
            a.setFormaPagamento(rs.getString("forma_pagamento"));
            a.setDataPagamento(rs.getDate("data_pagamento"));
            a.setDataAtendimento(rs.getDate("data_atendimento"));
            a.setStatusAgendamento(rs.getString("status"));
            a.setDataCancelar(rs.getDate("data_cancelar"));
            a.setDataRegistroAtendimento(rs.getDate("data_registro"));
        }
        this.desconectar();

        return a;

    }

    public ArrayList<Atendimento> horarioFuncionario(Timestamp data, int idFuncionario) throws Exception {
        ArrayList<Atendimento> lista = new ArrayList<Atendimento>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.sql.Timestamp data1 = new java.sql.Timestamp(data.getTime());
        String sql = "SELECT * FROM `atendimento` WHERE data=? and id_funcionario=? AND status!='Cancelado'";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setTimestamp(1,  data1);
        pstm.setInt(2, idFuncionario);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Atendimento a = new Atendimento();
            a.setId(rs.getInt("id"));
            a.setDataAgendamento(rs.getTimestamp("data"));
            a.setHoraAgendamento(rs.getTimestamp("hora"));
            lista.add(a);
        }
        this.desconectar();
        return lista;
    }

    public void confirmarPagamento(int id) throws Exception {
        String sql = "UPDATE atendimento SET status='Pago', data_pagamento=NOW(), data_atendimento=NOW() WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public void concelarAgendamento(int id) throws Exception {
        String sql = "UPDATE atendimento SET status='Cancelado', data_cancelar=NOW() WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
}
