//
//  ViewController.swift
//  MusicCalculator
//
//  Created by rsbj on 01/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        caracteristicasPicker1.inputView = pickerView1
        caracteristicasPicker2.inputView = pickerView2
        caracteristicasPicker3.inputView = pickerView3
        caracteristicasPicker4.inputView = pickerView4
        // Faz com que quando clicar no  textfield apareça um picker
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        pickerView2.delegate = self
        pickerView2.dataSource = self
        pickerView3.delegate = self
        pickerView3.dataSource = self
        pickerView4.delegate = self
        pickerView4.dataSource = self
        // delegate e datasource dos pickers
        
        pickerView1.tag = 1
        pickerView2.tag = 2
        pickerView3.tag = 3
        pickerView4.tag = 4
        // Usado para diferenciar os pickers de cada textfield pra n ter interferencia
        }

    
    @IBOutlet weak var primeiraTela: UIView!
    // View da tela inicial
    @IBOutlet weak var caracteristicasPicker1: UITextField!
    // TextFiel de coleta caracteristicas 1
    @IBOutlet weak var caracteristicasPicker2: UITextField!
    // TextFiel de coleta caracteristicas 2
    @IBOutlet weak var caracteristicasPicker3: UITextField!
    // TextFiel de coleta caracteristicas 3
    @IBOutlet weak var caracteristicasPicker4: UITextField!
    // TextFiel de coleta caracteristicas 4
    @IBOutlet weak var segundaTela: UIView!
    // View da tela de resultado
    @IBOutlet weak var melhorLabel: UILabel!
    // Onde vai dizer o tipo de musica mais compativel
    // @IBOutlet weak var melhorImageView: UIImageView!
    // Onde vai mostrar a foto do tipo de musica mais compativel
    // FLOPOU
    @IBOutlet weak var piorLabel: UILabel!
    // Onde vai dizer o tipo de musica menos compativel
    //@IBOutlet weak var piorImageView: UIImageView!
    // Onde vai mostrar a foto do tipo de musica menos compativel
    // FLOPOU
    
    let pickerOp: [String] = ["Ação","Aventura","Terror","Drama","Fantasia","2D","3D","Adulto","Infantil","Juvenil","Mobile","PC","Console","Curta Duração","Longa Duração","Media Duração"]
    // Opções que vão aparecer no picker
    
    var pickerView1 = UIPickerView()
    var pickerView2 = UIPickerView()
    var pickerView3 = UIPickerView()
    var pickerView4 = UIPickerView()
    // Declarando o picker como pickerView

    
    func leCaracteristicas()-> (String,String,String,String){
        //le os 4 caracteristicas
        let caracteristica1 : String = caracteristicasPicker1.text ?? ""
        let caracteristica2 : String = caracteristicasPicker2.text ?? ""
        let caracteristica3 : String = caracteristicasPicker3.text ?? ""
        let caracteristica4 : String = caracteristicasPicker4.text ?? ""
        return (caracteristica1,caracteristica2,caracteristica3,caracteristica4)
    } // OK
    
    @IBAction func calcular() {
        // Ação que será executada ao clicar no botão de calcular
        
        let caracteristicasDoUsuario = leCaracteristicas()
        
/*      var  comparacao1 : Compara
        var  comparacao2 : Compara
        var  comparacao3 : Compara
        var  comparacao4 : Compara
        comparacao1 = Compara(caracteristicaDada: caracteristicasDoUsuario.0)
        comparacao2 = Compara(caracteristicaDada: caracteristicasDoUsuario.1)
        comparacao3 = Compara(caracteristicaDada: caracteristicasDoUsuario.2)
        comparacao4 = Compara(caracteristicaDada: caracteristicasDoUsuario.3)
*/      // FAIL
        
        var jogos1 : (Int,Int,Int,Int,Int,Int,Int)
        // recebe os dados de comparação referentes ao 1 TextField
        var jogos2 : (Int,Int,Int,Int,Int,Int,Int)
        // recebe os dados de comparação referentes ao 2 TextField
        var jogos3 : (Int,Int,Int,Int,Int,Int,Int)
        // recebe os dados de comparação referentes ao 3 TextField
        var jogos4 : (Int,Int,Int,Int,Int,Int,Int)
        // recebe os dados de comparação referentes ao 4 TextField
        var jogosT : (Int,Int,Int,Int,Int,Int,Int)
        // recebe todos dados de comparação
        var resultado : (String, String, String, String)
        // recebe os resultados depois de analizados
        
        jogos1 = comparaAe(caracDada: caracteristicasDoUsuario.0)
        jogos2 = comparaAe(caracDada: caracteristicasDoUsuario.1)
        jogos3 = comparaAe(caracDada: caracteristicasDoUsuario.2)
        jogos4 = comparaAe(caracDada: caracteristicasDoUsuario.3)
        
        jogosT = ((jogos1.0 + jogos2.0 + jogos3.0 + jogos4.0),(jogos1.1 + jogos2.1 + jogos3.1 + jogos4.1),(jogos1.2 + jogos2.2 + jogos3.2 + jogos4.2),(jogos1.3 + jogos2.3 + jogos3.3 + jogos4.3),(jogos1.4 + jogos2.4 + jogos3.4 + jogos4.4),(jogos1.5 + jogos2.5 + jogos3.5 + jogos4.5),(jogos1.6 + jogos2.6 + jogos3.6 + jogos4.6))
        
        
        resultado = analiza(mario: jogosT.0, dSims: jogosT.1, fiveNig: jogosT.2, clashOC: jogosT.3, braw: jogosT.4, mine: jogosT.5, bomba: jogosT.6)
        
        if caracteristicasDoUsuario.0 != "" || caracteristicasDoUsuario.1 != "" || caracteristicasDoUsuario.2 != "" || caracteristicasDoUsuario.3 != "" {
            primeiraTela.isHidden = true // esconde a tela inicial
            segundaTela.isHidden = false // mostra a tela de resultados
        
            melhorLabel.text = resultado.0 // coloca o resultado, que mais se encaixa, na label
            piorLabel.text = resultado.1   // coloca o resultado, que menos se encaixa, na label
        }
        //melhorImageView.image = resultado.2 // coloca o resultado, que mais se encaixa, na ImageView
        //piorImageView.image = resultado.3  // coloca o resultado, que menos se encaixa, na ImageView
        // Flopou
     } // OK
    
    @IBAction func fechaResultado() {
        // Ação realizada ao fechar a tela de resultados
        segundaTela.isHidden = true // esconde a tela de resultados
        primeiraTela.isHidden = false // mostra a tela inicial
        caracteristicasPicker1.text = ""
        caracteristicasPicker2.text = ""
        caracteristicasPicker3.text = ""
        caracteristicasPicker4.text = ""
    } // OK
    
    func comparaAe (caracDada:String) -> (Int,Int,Int,Int,Int,Int,Int){
        var check : Int = 0
        var mario = 0
        var dSims = 0
        var fiveNig = 0
        var clashOC = 0
        var braw = 0
        var mine = 0
        var bomba = 0
        
        switch caracDada {
        case "Ação":
            braw = braw + 1
        case "Aventura":
            mine = mine + 1
        case "Terror":
            fiveNig = fiveNig + 1
        case "Drama":
            dSims = dSims + 1
        case "Fantasia":
            braw = braw + 1
            clashOC = clashOC + 1
        case "2D":
            braw = braw + 1
            mario = mario + 1
            clashOC = clashOC + 1
        case "3D":
            mine = mine + 1
            bomba = bomba + 1
            fiveNig = fiveNig + 1
            dSims = dSims + 1
        case "Adulto":
            fiveNig = fiveNig + 1
        case "Infantil":
            braw = braw + 1
            mario = mario + 1
            mine = mine + 1
        case "Juvenil":
            bomba = bomba + 1
            clashOC = clashOC + 1
            dSims = dSims + 1
        case "Mobile":
            fiveNig = fiveNig + 1
            mine = mine + 1
            clashOC = clashOC + 1
        case "PC":
            fiveNig = fiveNig + 1
            braw = braw + 1
            mine = mine + 1
            dSims = dSims + 1
        case "Console":
            mario = mario + 1
            mine = mine + 1
            bomba = bomba + 1
            dSims = dSims + 1
        case "Curta Duração":
            clashOC = clashOC + 1
            fiveNig = fiveNig + 1
        case "Longa Duração":
            mario = mario + 1
            bomba = bomba + 1
        case "Media Duração":
            dSims = dSims + 1
            mine = mine + 1
            braw = braw + 1
        default:
            check = 1
            }
        return (mario,dSims,fiveNig,clashOC,braw,mine,bomba)
    } // OK
    
    func analiza (mario : Int,dSims : Int,fiveNig : Int,clashOC : Int,braw : Int,mine : Int,bomba : Int) -> (String, String, String, String) {
        var maior : Int = 0
        var menor : Int = 100
        var contador : Int = 0
        var stringMaior : String = ""
        var stringMenor : String = ""
        var imgmaior : String = ""
        var imgmenor : String = ""
        
        while contador <= 10{
            if  mario > maior {
                maior = mario
            } else if  dSims > maior {
                maior = dSims
            } else if  fiveNig > maior {
                maior = fiveNig
            } else if  clashOC > maior {
                maior = clashOC
            } else if  braw > maior {
                maior = braw
            }  else if  mine > maior {
                maior = mine
            }
            
            if  mario < menor {
                    menor = mario
            } else if  dSims < menor {
                menor = dSims
            } else if  fiveNig < menor {
                menor = fiveNig
            } else if  clashOC < menor {
                menor = clashOC
            } else if  braw < menor {
                menor = braw
            }  else if  mine < menor {
                menor = mine
            }

            contador = contador + 1

        }
        
        if  bomba == maior {
            stringMaior = "Funk"
            imgmaior = "funkMC"
        } else if  mario == maior {
            stringMaior = "8-Bit"
            imgmaior = "8-BitMC"
        } else if  dSims == maior {
            stringMaior = "Jazz"
            imgmaior = "jazzMC"
        } else if  fiveNig == maior {
            stringMaior = "Rock"
            imgmaior = "rockMC"
        } else if  clashOC == maior {
            stringMaior = "Ambiente"
            imgmaior = "ambienteMC"
        } else if  braw == maior {
            stringMaior = "Temática"
            imgmaior = "tematicaMC"
        }  else if  mine == maior {
            stringMaior = "Clássica"
            imgmaior = "classicaMC"
        }
        if  bomba == menor {
            stringMenor = "Funk"
            imgmenor = "funkMC"
        } else if  mario == menor {
            stringMenor = "8-Bit"
            imgmenor = "8-BitMC"
        } else if  dSims == menor {
            stringMenor = "Jazz"
            imgmenor = "jazzMC"
        } else if  fiveNig == menor {
            stringMenor = "Rock"
            imgmenor = "rockMC"
        } else if  clashOC == menor {
            stringMenor = "Ambiente"
            imgmenor = "ambienteMC"
        } else if  braw == menor {
            stringMenor = "Temática"
            imgmenor = "tematicaMC"
        }  else if  mine == menor {
            stringMenor = "Clássica"
            imgmenor = "classicaMC"
        }

        return (stringMaior,stringMenor,imgmaior,imgmenor)
    } // OK
}
/*    func limpa(){
        Jogos.mario = 0
        Jogos.dSims = 0
        Jogos.fiveNig = 0
        Jogos.clashOC = 0
        Jogos.braw = 0
        Jogos.mine = 0
        Jogos.bomba = 0
    }
}*/

/*class Compara {

    let caracteristicaDada : String
    
    init (caracteristicaDada:String){
        self.caracteristicaDada = caracteristicaDada
        comparaAe(caracDada: caracteristicaDada)
    }
    
    
    func comparaAe (caracDada:String){
        var check : Int = 0
        
        switch caracDada {
        case "Ação":
            Jogos.braw = Jogos.braw + 1
        case "Aventura":
            Jogos.mine = Jogos.mine + 1
        case "Terror":
            Jogos.fiveNig = Jogos.fiveNig + 1
        case "Drama":
            Jogos.dSims = Jogos.dSims + 1
        case "Fantasia":
            Jogos.braw = Jogos.braw + 1
            Jogos.clashOC = Jogos.clashOC + 1
        case "2D":
            Jogos.braw = Jogos.braw + 1
            Jogos.mario = Jogos.mario + 1
            Jogos.clashOC = Jogos.clashOC + 1
        case "3D":
            Jogos.mine = Jogos.mine + 1
            Jogos.bomba = Jogos.bomba + 1
            Jogos.fiveNig = Jogos.fiveNig + 1
            Jogos.dSims = Jogos.dSims + 1
        case "Adulto":
            Jogos.fiveNig = Jogos.fiveNig + 1
        case "Infantil":
            Jogos.braw = Jogos.braw + 1
            Jogos.mario = Jogos.mario + 1
            Jogos.mine = Jogos.mine + 1
        case "Juvenil":
            Jogos.bomba = Jogos.bomba + 1
            Jogos.clashOC = Jogos.clashOC + 1
            Jogos.dSims = Jogos.dSims + 1
        case "Mobile":
            Jogos.fiveNig = Jogos.fiveNig + 1
            Jogos.mine = Jogos.mine + 1
            Jogos.clashOC = Jogos.clashOC + 1
        case "PC":
            Jogos.fiveNig = Jogos.fiveNig + 1
            Jogos.braw = Jogos.braw + 1
            Jogos.mine = Jogos.mine + 1
            Jogos.dSims = Jogos.dSims + 1
        case "Console":
            Jogos.mario = Jogos.mario + 1
            Jogos.mine = Jogos.mine + 1
            Jogos.bomba = Jogos.bomba + 1
            Jogos.dSims = Jogos.dSims + 1
        case "Curta Duração":
            Jogos.clashOC = Jogos.clashOC + 1
            Jogos.fiveNig = Jogos.fiveNig + 1
        case "Longa Duração":
            Jogos.mario = Jogos.mario + 1
            Jogos.bomba = Jogos.bomba + 1
        case "Media Duração":
            Jogos.dSims = Jogos.dSims + 1
            Jogos.mine = Jogos.mine + 1
            Jogos.braw = Jogos.braw + 1
        default:
            check = 1
            }
    }
}

class Jogos {
    static var mario : Int = 0
    static var clashOC : Int = 0
    static var mine : Int = 0
    static var bomba : Int = 0
    static var dSims : Int = 0
    static var braw : Int = 0
    static var fiveNig : Int = 0
    
}*/ // FAIL

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOp.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOp[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            caracteristicasPicker1.text = pickerOp[row]
            caracteristicasPicker1.resignFirstResponder()
        case 2:
            caracteristicasPicker2.text = pickerOp[row]
            caracteristicasPicker2.resignFirstResponder()
        case 3:
            caracteristicasPicker3.text = pickerOp[row]
            caracteristicasPicker3.resignFirstResponder()
        case 4:
            caracteristicasPicker4.text = pickerOp[row]
            caracteristicasPicker4.resignFirstResponder()
        default: break
        }
    }
     
} // OK

