unit uScriptsDeAtualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, BuscadorDeAtualizacoesBD;

type
  TfrmScriptsDeAtualizacao = class(TForm, IBuscadorDeAtualizacoesBD)
    versao: TMemo;
    versao1: TMemo;
    versao2: TMemo;
    versao3: TMemo;
    versao4: TMemo;
    versao5: TMemo;
    versao6: TMemo;
    versao7: TMemo;
    versao8: TMemo;
    versao9: TMemo;
    versao10: TMemo;
    versao11: TMemo;
    versao12: TMemo;
    versao13: TMemo;
    versao14: TMemo;
    versao15: TMemo;
    versao16: TMemo;
    versao17: TMemo;
    versao18: TMemo;
    versao19: TMemo;
    versao20: TMemo;
    versao21: TMemo;
    versao22: TMemo;
    versao23: TMemo;
    versao24: TMemo;
    versao25: TMemo;
    versao26: TMemo;
    versao27: TMemo;
    versao28: TMemo;
    versao29: TMemo;
    versao30: TMemo;
    versao31: TMemo;
    versao32: TMemo;
    versao33: TMemo;
    versao34: TMemo;
    versao35: TMemo;
    versao36: TMemo;
    versao37: TMemo;
    versao38: TMemo;
    versao39: TMemo;
    versao40: TMemo;
    versao41: TMemo;
    versao42: TMemo;
    versao43: TMemo;
    versao44: TMemo;
    versao45: TMemo;
    versao46: TMemo;
    versao47: TMemo;
    versao48: TMemo;
    versao49: TMemo;
    versao50: TMemo;
    versao51: TMemo;
    versao52: TMemo;
    versao53: TMemo;
    versao54: TMemo;
    versao55: TMemo;
    versao56: TMemo;
    versao57: TMemo;
    versao58: TMemo;
    versao59: TMemo;
    versao60: TMemo;
    versao61: TMemo;
    versao62: TMemo;
    versao63: TMemo;
    versao64: TMemo;
    versao65: TMemo;
    versao66: TMemo;
    versao67: TMemo;
    versao68: TMemo;
    versao69: TMemo;
    versao70: TMemo;
    versao71: TMemo;
    versao72: TMemo;
    versao73: TMemo;
    versao74: TMemo;
    versao75: TMemo;
    versao76: TMemo;
    versao77: TMemo;
    versao78: TMemo;
    versao79: TMemo;
    versao80: TMemo;
    versao81: TMemo;
    versao82: TMemo;
    versao83: TMemo;
    versao84: TMemo;
    versao85: TMemo;
    versao86: TMemo;
    versao87: TMemo;
    versao88: TMemo;
    versao89: TMemo;
    versao90: TMemo;
    versao91: TMemo;
    versao92: TMemo;
    versao93: TMemo;
    versao94: TMemo;
    versao95: TMemo;
    versao96: TMemo;
    versao97: TMemo;
    versao98: TMemo;
    versao99: TMemo;
    versao100: TMemo;
    versao101: TMemo;
    versao102: TMemo;
    versao103: TMemo;
    versao104: TMemo;
    versao105: TMemo;
    versao106: TMemo;
    versao107: TMemo;
    versao108: TMemo;
    versao109: TMemo;
    versao110: TMemo;
    versao111: TMemo;
    versao112: TMemo;
    versao113: TMemo;
    versao114: TMemo;
    versao115: TMemo;
    versao116: TMemo;
    versao117: TMemo;
    versao118: TMemo;
    versao119: TMemo;
    versao120: TMemo;
    versao121: TMemo;
    versao122: TMemo;
    versao123: TMemo;
    versao124: TMemo;
    versao125: TMemo;
    versao126: TMemo;
    versao127: TMemo;
    versao128: TMemo;
    versao129: TMemo;
    versao130: TMemo;
    versao131: TMemo;
    versao132: TMemo;
    versao133: TMemo;
    versao134: TMemo;
    versao135: TMemo;
    versao136: TMemo;
    versao137: TMemo;
    versao138: TMemo;
    versao139: TMemo;
    versao140: TMemo;
    versao141: TMemo;
    versao142: TMemo;
    versao143: TMemo;
    versao144: TMemo;
    versao145: TMemo;
    versao146: TMemo;
    versao147: TMemo;
    versao148: TMemo;
    versao149: TMemo;
    versao150: TMemo;
    versao151: TMemo;
    versao152: TMemo;
    versao153: TMemo;
    versao154: TMemo;
    versao155: TMemo;
    versao156: TMemo;
    versao157: TMemo;
    versao158: TMemo;
    versao159: TMemo;
    versao160: TMemo;
    versao161: TMemo;
    versao162: TMemo;
    versao163: TMemo;
    versao164: TMemo;
    versao165: TMemo;
    versao166: TMemo;
    versao167: TMemo;
    versao168: TMemo;
    versao169: TMemo;
    versao170: TMemo;
    versao171: TMemo;
    versao172: TMemo;
    versao173: TMemo;
    versao174: TMemo;
    versao175: TMemo;
    versao176: TMemo;
    versao177: TMemo;
    versao178: TMemo;
    versao179: TMemo;
    versao180: TMemo;
    versao181: TMemo;
    versao182: TMemo;
    versao183: TMemo;
    versao184: TMemo;
    versao185: TMemo;
    versao186: TMemo;
    versao187: TMemo;
    versao188: TMemo;
    versao189: TMemo;
    versao190: TMemo;
    versao191: TMemo;
    versao192: TMemo;
    versao193: TMemo;
    versao194: TMemo;
    versao195: TMemo;
    versao196: TMemo;
    versao197: TMemo;
    versao199: TMemo;
    versao198: TMemo;
    versao200: TMemo;
    versao201: TMemo;
    versao202: TMemo;
    versao203: TMemo;
    versao204: TMemo;
    versao205: TMemo;
    versao206: TMemo;
    versao207: TMemo;
    versao208: TMemo;
    versao209: TMemo;
    versao210: TMemo;
    versao211: TMemo;
    versao212: TMemo;
    versao213: TMemo;
    versao214: TMemo;
    Memo1: TMemo;
    versao215: TMemo;
    versao216: TMemo;
    versao217: TMemo;
    versao218: TMemo;
    versao219: TMemo;
    versao220: TMemo;
    versao221: TMemo;
    versao222: TMemo;
    versao223: TMemo;
    versao224: TMemo;
    versao225: TMemo;
    versao226: TMemo;
    versao227: TMemo;
    versao228: TMemo;
    versao229: TMemo;
    versao230: TMemo;
    versao231: TMemo;
    versao232: TMemo;
    versao233: TMemo;
    versao234: TMemo;
    versao235: TMemo;
    versao236: TMemo;
    versao237: TMemo;
    versao238: TMemo;
    versao239: TMemo;
    versao240: TMemo;
    versao241: TMemo;
    versao242: TMemo;

  private

  public
     function BuscaScriptPorNumeroDaVersao(const NumeroDaVersao :Integer) :String;
  end;
var
  frmScriptsDeAtualizacao: TfrmScriptsDeAtualizacao;


implementation

{$R *.dfm}

{ TfrmScriptsDeAtualizacao }

function TfrmScriptsDeAtualizacao.BuscaScriptPorNumeroDaVersao(
  const NumeroDaVersao :Integer): String;
var
  Memo :TMemo;
begin
   result := '';

   Memo   := TMemo(self.FindComponent('versao'+IntToStr(NumeroDaVersao)));

   if not Assigned(Memo) then
    exit;

   result := Memo.Text;
end;

end.

