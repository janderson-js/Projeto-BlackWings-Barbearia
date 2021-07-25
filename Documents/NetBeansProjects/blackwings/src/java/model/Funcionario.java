
package model;

import java.sql.Timestamp;
import java.util.ArrayList;


public class Funcionario {
    private int id;
    private String nome;
    private Timestamp dataNascimento;
    private String telefoneContato;
    private String telefone;
    private String matricula;
    private String senha;
    private String cep;
    private String cidade;
    private String bairro;
    private String endereco;
    private String casa;
    private Timestamp dataContrato;
    private Timestamp dataFinalContrato;
    private Timestamp dataSaida;
    private String status;
    private Perfil perfil;
    private ArrayList<Servico> meusServicos;

    public ArrayList<Servico> getMeusServicos() {
        return meusServicos;
    }

    public void setMeusServicos(ArrayList<Servico> meusServicos) {
        this.meusServicos = meusServicos;
    }

    public Timestamp getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Timestamp dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
    
    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefoneContato() {
        return telefoneContato;
    }

    public void setTelefoneContato(String telefoneContato) {
        this.telefoneContato = telefoneContato;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCasa() {
        return casa;
    }

    public void setCasa(String casa) {
        this.casa = casa;
    }

    public Timestamp getDataContrato() {
        return dataContrato;
    }

    public void setDataContrato(Timestamp dataContrato) {
        this.dataContrato = dataContrato;
    }

    public Timestamp getDataFinalContrato() {
        return dataFinalContrato;
    }

    public void setDataFinalContrato(Timestamp dataFinalContrato) {
        this.dataFinalContrato = dataFinalContrato;
    }

    public Timestamp getDataSaida() {
        return dataSaida;
    }

    public void setDataSaida(Timestamp dataSaida) {
        this.dataSaida = dataSaida;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
    
}
