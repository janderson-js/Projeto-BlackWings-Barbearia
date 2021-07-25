package model;

import java.sql.Timestamp;
import java.util.Date;

public class Atendimento {
    private int id;
    private Timestamp dataAgendamento;
    private Timestamp horaAgendamento;
    private double valorAgendamento;
    private String formaPagamento;
    private Date dataPagamento;
    private Date dataAtendimento;
    private Date cancelarAgendamento;
    private String statusAgendamento;
    private Date dataRegistroAtendimento;
    private Cliente cliente;
    private Funcionario funcionario;
    private Servico servico;
    private Date dataCancelar;

    public Date getDataCancelar() {
        return dataCancelar;
    }

    public void setDataCancelar(Date dataCancelar) {
        this.dataCancelar = dataCancelar;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDataAgendamento() {
        return dataAgendamento;
    }

    public void setDataAgendamento(Timestamp dataAgendamento) {
        this.dataAgendamento = dataAgendamento;
    }

    public Timestamp getHoraAgendamento() {
        return horaAgendamento;
    }

    public void setHoraAgendamento(Timestamp horaAgendamento) {
        this.horaAgendamento = horaAgendamento;
    }

    public double getValorAgendamento() {
        return valorAgendamento;
    }

    public void setValorAgendamento(double valorAgendamento) {
        this.valorAgendamento = valorAgendamento;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public Date getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public Date getDataAtendimento() {
        return dataAtendimento;
    }

    public void setDataAtendimento(Date dataAtendimento) {
        this.dataAtendimento = dataAtendimento;
    }

    public Date getCancelarAgendamento() {
        return cancelarAgendamento;
    }

    public void setCancelarAgendamento(Date cancelarAgendamento) {
        this.cancelarAgendamento = cancelarAgendamento;
    }

    public String getStatusAgendamento() {
        return statusAgendamento;
    }

    public void setStatusAgendamento(String statusAgendamento) {
        this.statusAgendamento = statusAgendamento;
    }

    public Date getDataRegistroAtendimento() {
        return dataRegistroAtendimento;
    }

    public void setDataRegistroAtendimento(Date dataRegistroAtendimento) {
        this.dataRegistroAtendimento = dataRegistroAtendimento;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }
    
}
