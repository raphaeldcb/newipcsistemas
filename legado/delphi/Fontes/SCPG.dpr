program SCPG;

uses
  Forms,
  Windows,
  SysUtils,
  IniFiles,
  Registry,
  ufPadrao in 'ufPadrao.pas' {fPadrao},
  ufDM in 'ufDM.pas' {DM: TDataModule},
  ufDMR in 'ufDMR.pas' {DMR: TDataModule},
  ufTimer in 'ufTimer.pas' {fTimer},
  ufAcesso in 'ufAcesso.pas' {fAcesso},
  ufBits in 'ufBits.pas',
  ufComarca in 'ufComarca.pas' {fComarca},
  ufConsultaComarca in 'ufConsultaComarca.pas' {fConsultaComarca},
  ufConsultaCPG in 'ufConsultaCPG.pas' {fConsultaCPG},
  ufConsultaItemHistorico in 'ufConsultaItemHistorico.pas' {fConsultaItemHistorico},
  ufConsultaLocaisColeta in 'ufConsultaLocaisColeta.pas' {fConsultaLocaisColetas},
  ufConsultaPericia in 'ufConsultaPericia.pas' {fConsultaPericia},
  ufConsultaVara in 'ufConsultaVara.pas' {fConsultaVara},
  ufEstado in 'ufEstado.pas' {fEstado},
  ufGeradorRelFinanceiro in 'ufGeradorRelFinanceiro.pas' {fEmissaoRelFinanceiro},
  ufGeraValorColetadores in 'ufGeraValorColetadores.pas' {fGeraValorColetadores},
  ufGeraWord in 'ufGeraWord.pas' {fExpWord},
  ufGrupo in 'ufGrupo.pas' {fRestricao},
  ufHistorico in 'ufHistorico.pas' {fHistorico},
  ufItemHistorico in 'ufItemHistorico.pas' {fItemHist},
  ufParametros in 'ufParametros.pas' {fParametros},
  ufParcelamento in 'ufParcelamento.pas' {fParcelamento},
  ufProcesso in 'ufProcesso.pas' {fProcessos},
  ufRegras in 'ufRegras.pas' {fRegras},
  ufRelConsulta in 'ufRelConsulta.pas' {fRelConsulta},
  ufRelEtiquetas in 'ufRelEtiquetas.pas' {fRelEtiquetas},
  ufRelFinanceiro in 'ufRelFinanceiro.pas' {fRelFinanceiro},
  ufRelLaudosPendentes in 'ufRelLaudosPendentes.pas' {fRelLaudosPendentes},
  ufTipoCasoPreco in 'ufTipoCasoPreco.pas' {fCasoPreco},
  ufUsuarios in 'ufUsuarios.pas' {fUsuarios},
  ufVara in 'ufVara.pas' {fVara},
  UnitFormAbertura in 'UnitFormAbertura.pas' {fAbertura},
  ufKits in 'ufKits.pas' {fKits},
  ufConsultaKits in 'ufConsultaKits.pas' {fConsultaKits},
  ufEmissaoKits in 'ufEmissaoKits.pas' {fEmissaoKits},
  ufImportaDados in 'ufImportaDados.pas' {fImportaDados},
  ufRelCapa in 'ufRelCapa.pas' {fRelCapa},
  ufPessoas in 'ufPessoas.pas' {fPessoas},
  ufJuiz in 'ufJuiz.pas' {fJuiz},
  ufPesquisa in 'ufPesquisa.pas' {fPesquisa},
  ufEmissaoRelQuantidades in 'ufEmissaoRelQuantidades.pas' {fEmissaoRelEnviados},
  ufEmissaoLaudosEmitidos in 'ufEmissaoLaudosEmitidos.pas' {fEmissaoRelLaudosEmitidos},
  ufRelLaudosEmitidos in 'ufRelLaudosEmitidos.pas' {fRelLaudosEmitidos},
  ufMapa_ExtAmpli in 'ufMapa_ExtAmpli.pas' {fMapa_ExtAmpli},
  ufConsultaLotes in 'ufConsultaLotes.pas' {fConsultaLotes},
  ufImpressoes in 'ufImpressoes.pas' {fImpressoes},
  ufLaudosVencendoPeriodo in 'ufLaudosVencendoPeriodo.pas' {fLaudosVencendoPeriodo},
  ufGeraDocLab in 'ufGeraDocLab.pas' {fAlelos},
  ufConsultaJuiz in 'ufConsultaJuiz.pas' {fConsultaJuizes},
  ufConsultaEnderecos in 'ufConsultaEnderecos.pas' {fConsultaEnderecos},
  ufConsultaAlelosDuplicados in 'ufConsultaAlelosDuplicados.pas' {fConsultaAlelosDuplicados},
  ufColetadoresRelatorios in 'ufColetadoresRelatorios.pas' {fColetadoresRelatorios},
  ufLocaisColeta in 'ufLocaisColeta.pas' {fLocaisColeta},
  ufColetadoresKits in 'ufColetadoresKits.pas' {fColetadoresKits},
  fExclusaoLotes in 'fExclusaoLotes.pas' {fExcluiLotes},
  ufConsultaAuditoria in 'ufConsultaAuditoria.pas' {fConsultaAuditoria},
  ufRastrearKits in 'ufRastrearKits.pas' {fRastrearKits},
  ufConsultaDadosparaCredito in 'ufConsultaDadosparaCredito.pas' {fCreditoHabilitacao},
  ufVinculaCreditos in 'ufVinculaCreditos.pas' {fVinculaCreditos},
  ufRelCreditosJuiz in 'ufRelCreditosJuiz.pas' {fRelCreditosporJuiz},
  ufExportaAlelosPlanilhas in 'ufExportaAlelosPlanilhas.pas' {fExportacaoAlelos},
  ufImprimeFolhaResultados in 'ufImprimeFolhaResultados.pas' {fImprimeFolhaResultados},
  ufExportaExcel in 'ufExportaExcel.pas' {fExportaExcel},
  ufCompraKits in 'ufCompraKits.pas' {fCompraKits},
  ufCasoEndereco in 'ufCasoEndereco.pas' {fCasoEndereco},
  ufRelCapa2 in 'ufRelCapa2.pas' {fRelCapa2},
  ufEmissaoLColetaExames in 'ufEmissaoLColetaExames.pas' {fEmissaoLColetaExames},
  ufDMI in 'scei\ufDMI.pas' {DMI: TDataModule},
  ufDMRI in 'scei\ufDMRI.pas' {DMRI: TDataModule},
  ufExames in 'scei\ufExames.pas' {fExames},
  ufConsultaGeralInf in 'scei\ufConsultaGeralInf.pas' {fConsultaGeralInf},
  ufLaboratorios in 'scei\ufLaboratorios.pas' {fLaboratorios},
  ufMedicos in 'scei\ufMedicos.pas' {fMedicos},
  ufPacientes in 'scei\ufPacientes.pas' {fPacientes},
  ufProcedimentos in 'scei\ufProcedimentos.pas' {fProcedimentos},
  ufConsultaLaboratorios in 'ufConsultaLaboratorios.pas' {fConsultaLaboratorios},
  ufConsultaPacientes in 'scei\ufConsultaPacientes.pas' {fConsultaPacientes},
  ufEmissaoLaudos in 'scei\ufEmissaoLaudos.pas' {fEmissaoLaudo},
  ufImprimeComprovante in 'scei\ufImprimeComprovante.pas' {fImprimeComprovante},
  ufImprimeLaudo in 'ufImprimeLaudo.pas' {fImprimeLaudo},
  ufImprimeLaudoImpressora in 'scei\ufImprimeLaudoImpressora.pas' {fImprimeLaudoImpressora},
  ufImprimeMapa in 'scei\ufImprimeMapa.pas' {fImprimeMapa},
  ufLancaProcedimentos in 'scei\ufLancaProcedimentos.pas' {fLancaProcedimentos},
  ufGeradorRelInfecciosas in 'ufGeradorRelInfecciosas.pas' {fEmissaoRelInfecciosas},
  ufExtracao in 'ufExtracao.pas' {fExtracao},
  ufExtracaoCasos in 'ufExtracaoCasos.pas' {fExtracaoCasos},
  fUserValidaExtracao in 'fUserValidaExtracao.pas' {fValidaExtracao},
  ufExamesResultados in 'scei\ufExamesResultados.pas' {fProcedimentosResultados},
  ufRelMinimoKits in 'ufRelMinimoKits.pas' {fRelMinimoKits},
  ufGeraDocLabTipos in 'ufGeraDocLabTipos.pas' {fAlelosTipos},
  ufAlteraSenha in 'ufAlteraSenha.pas' {fAlteraSenha},
  ufLocaisColetaComprovantes in 'ufLocaisColetaComprovantes.pas' {fLocaisColetaComprovante},
  ufRelEtiquetasAdesiva in 'ufRelEtiquetasAdesiva.pas' {fRelEtiquetasAdesiva},
  ufMapa_ExtAmpliNew in 'ufMapa_ExtAmpliNew.pas' {fMapa_ExtAmpliNew},
  ufRecebimentoLaboratorio in 'ufRecebimentoLaboratorio.pas' {fRecebimentoLaboratorio},
  ufConsultaStatus in 'ufConsultaStatus.pas' {fConsultaStatus},
  ufColaborador in 'ufColaborador.pas' {fColaborador},
  ufColaboradorImporta in 'ufColaboradorImporta.pas' {fColaboradorPonto},
  ufColaboradorExporta in 'ufColaboradorExporta.pas' {fColaboradorExporta},
  ufEmissaoLaudosAgrupadoNew in 'ufEmissaoLaudosAgrupadoNew.pas' {fEmissaoLaudosAgrupadoNew},
  ufImportaProcedimentos in 'ufImportaProcedimentos.pas' {fImportaFacil},
  ufImportaProcedimentosHist in 'ufImportaProcedimentosHist.pas' {fImportaFacilHist},
  ufParcelamento_Infe in 'ufParcelamento_Infe.pas' {fParcelamento_Infe},
  ufAjustaProcotolo in 'ufAjustaProcotolo.pas' {fAjustaProtocolo},
  ufCarga in 'scei\ufCarga.pas' {fCarga},
  ufServicoAutoma in 'scei\ufServicoAutoma.pas' {fServicoAutoma},
  ufImprimeLaudo2 in 'ufImprimeLaudo2.pas' {fImprimeLaudo2},
  ufCreditosJuiz in 'ufCreditosJuiz.pas' {fCreditosGeracao},
  ufCalculoPaternidade in 'ufCalculoPaternidade.pas' {fCalculaPaternidade},
  ufDMD in 'ufDMD.pas' {DMD: TDataModule},
  ufGeradorRelEtiquetas in 'ufGeradorRelEtiquetas.pas' {fEmissaoEtiquetas},
  Vcl.Themes,
  Vcl.Styles,
  ufImprimeComprovantePaternidade in 'ufImprimeComprovantePaternidade.pas' {fImprimeComprExaPater},
  ufColetadorAdicional in 'ufColetadorAdicional.pas' {fColetadorAdicional},
  UFUNCOES in 'UFUNCOES.PAS',
  ufEnvioCasosExternos in 'ufEnvioCasosExternos.pas' {fEnvioCasosExternos},
  ufGeracaoCreditoNew in 'ufGeracaoCreditoNew.pas' {fGeracaoCreditos},
  QRCODE in 'qrcode\src\QRCODE.pas';

{$R *.res}
var
   s,Fn,Fp,pathExecutavel,VersaoSCPG,Fnd,Caminho,CaminhoAtualizacao : String;
   TSI : TStartupInfo;
   TPI : TProcessInformation;
   arq, Arquivo : TIniFile;
   Registro :  TRegistry;

begin

   Caminho := ExtractFilePath(Application.ExeName)+'SCPG.ini';

   if not FileExists( Caminho )
   then begin
         Arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+'SCPG.ini');
         Arquivo.WriteString('DADOS', 'DATABASE', '192.168.16.7:D:\BancoDados\CPG\Base\SGBD_SCPG.FDB');
         Arquivo.WriteString('DADOS', 'ATUALIZACAO', '\\192.168.16.7\Sistemas\Atualizacao\SCPG\');
         Arquivo.Free;
        end;



  Caminho            := ExtractFilePath(Application.ExeName)+'SCPG.ini';
  Arquivo            := TIniFile.Create(Caminho);
  CaminhoAtualizacao := Arquivo.ReadString('DADOS','ATUALIZACAO','');


   Fn := ExtractFileName(ParamStr(0));

   pathExecutavel     := CaminhoAtualizacao;
   VersaoSCPG         := GetBuildInfo1();

   if (pathExecutavel <> '') then
      begin
        if (FileAge(pathExecutavel+Fn) > FileAge(ParamStr(0))) then
           begin
              Fnd := ExtractFileDir(ParamStr(0))+'\'+ExtractFileName(pathExecutavel+Fn) ;
              FillChar(TSI, SizeOf(TSI), 0);
              TSI.CB := SizeOf(TSI);
              TSI.dwFlags := STARTF_USESHOWWINDOW;
              TSI.wShowWindow := SW_SHOWNORMAL;
              Fp := Format('"%s" "%s|%s"',[pathExecutavel+'Upgrade.exe',pathExecutavel+Fn, Fnd ]);
              if CreateProcess (NIL, PChar(Fp), NIL, NIL, False,
                              DETACHED_PROCESS, NIL, NIL, TSI, TPI) then
              begin
                Exit;
              end
              else
              begin
                 messagebeep(0);
                 s := 'Impossível atualizar software. Erro: '+Inttostr(GetLastError());
                 Application.MessageBox(Pchar(s),'Erro de Atualização!',1);
              end;
           end;
      end;

  Application.Initialize;
  fAbertura := TfAbertura.Create(Application);
  fAbertura.Show;
  fAbertura.Update;
  Application.Title := 'CPG - Sistema de Controle de Perícias Genéticas';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfAcesso, fAcesso);
  Application.CreateForm(TDMD, DMD);
  Application.CreateForm(TDMI, DMI);
  Application.CreateForm(TDMR, DMR);
  Application.CreateForm(TDMRI, DMRI);
  Application.CreateForm(TfPadrao, fPadrao);
  repeat
  Application.ProcessMessages;
  until fAbertura.CloseQuery;
  fAbertura.Hide;
  fAbertura.Free;
  Application.Run;
end.
