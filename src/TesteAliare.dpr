program TesteAliare;

uses
  Vcl.Forms,
  uCadNegociacaoController in 'Controller\uCadNegociacaoController.pas',
  uDistribuidorController in 'Controller\uDistribuidorController.pas',
  uItensNegociacaoController in 'Controller\uItensNegociacaoController.pas',
  uLimiteCreditoController in 'Controller\uLimiteCreditoController.pas',
  uProdutoController in 'Controller\uProdutoController.pas',
  uProdutorController in 'Controller\uProdutorController.pas',
  uStatusNegociacaoController in 'Controller\uStatusNegociacaoController.pas',
  uDMCadNegociacao in 'DAO\uDMCadNegociacao.pas' {dtmCadNegociacao: TDataModule},
  uDMDistribuidor in 'DAO\uDMDistribuidor.pas' {dtmDistribuidor: TDataModule},
  uDMItensNegociacao in 'DAO\uDMItensNegociacao.pas' {dtmItensNegociacao: TDataModule},
  uDMLimiteCredito in 'DAO\uDMLimiteCredito.pas' {dtmLimiteCredito: TDataModule},
  uDMProduto in 'DAO\uDMProduto.pas' {dtmProduto: TDataModule},
  uDMProdutor in 'DAO\uDMProdutor.pas' {dtmProdutor: TDataModule},
  uDMStatusNegociacao in 'DAO\uDMStatusNegociacao.pas' {dtmStatusNegociacao: TDataModule},
  DMConexao in 'DataModule\DMConexao.pas' {dtmConexao: TDataModule},
  DMConsultaNegociacoes in 'DataModule\DMConsultaNegociacoes.pas' {dmPesquisaNegociacoes: TDataModule},
  uCadItensNegociacaoModel in 'Model\uCadItensNegociacaoModel.pas',
  uCadNegociacaoModel in 'Model\uCadNegociacaoModel.pas',
  uDistribuidorModel in 'Model\uDistribuidorModel.pas',
  uLimiteCreditoModel in 'Model\uLimiteCreditoModel.pas',
  uProdutoModel in 'Model\uProdutoModel.pas',
  uProdutorModel in 'Model\uProdutorModel.pas',
  uStatusNegociacaoModel in 'Model\uStatusNegociacaoModel.pas',
  Rotinas in 'Utils\Rotinas.pas',
  CadNegociacao in 'View\CadNegociacao.pas' {frmCadNegociacao},
  ConsultaNegociacoes in 'View\ConsultaNegociacoes.pas' {frmConsultaNegociacoes},
  Distribuidor in 'View\Distribuidor.pas' {frmDistribuidor},
  ManutencaoNegociacao in 'View\ManutencaoNegociacao.pas' {frmManutencaoNegociacao},
  Principal in 'View\Principal.pas' {frmPrincipal},
  Produto in 'View\Produto.pas' {frmProduto},
  Produtor in 'View\Produtor.pas' {frmProdutor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TdmPesquisaNegociacoes, dmPesquisaNegociacoes);
  Application.Run;
end.
