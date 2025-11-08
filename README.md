# 🧮 Calculadora de IMC

Uma aplicação **Flutter** simples e funcional para calcular o **Índice de Massa Corporal (IMC)**.

---

## ✨ Funcionalidades

- Entrada de peso e altura
- Cálculo automático do IMC
- Classificação do resultado:
  - Abaixo do peso
  - Peso normal
  - Sobrepeso
  - Obesidade
- Validação de entradas inválidas
- Testes automatizados com **Flutter Test**

---

## 📱 Interface

> Adicione aqui uma imagem da interface, por exemplo:
>
> ```markdown
> ![Tela da Calculadora de IMC](flutter_01.png)
> ![Tela de Resultado do IMC](flutter_02.png)
> ```

---

## 🚀 Como executar

```bash
flutter pub get
flutter run
```

---

## 🧪 Como testar

```bash
flutter test
```

---

## ✅ Testes incluídos

- Verifica se a interface carrega corretamente
- Valida entradas inválidas (altura zero, texto não numérico)
- Verifica a classificação correta do IMC (ex: obesidade, peso normal, etc.)

---

## 📂 Estrutura do projeto

```bash
calculadora_imc_flutter/
│
├── lib/                      # Código-fonte principal do app Flutter
│   ├── main.dart             # Ponto de entrada da aplicação
│   └── screens/              # Telas do aplicativo
│       ├── input_screen.dart     # Tela de entrada de dados do usuário
│       ├── result_screen.dart    # Tela de exibição do resultado do IMC
│       └── reference_screen.dart # Tela de referência com informações sobre o IMC
│
├── test/                     # Testes automatizados
│   ├── imc_test.dart
│   └── widget_test.dart
│
├── android/                  # Código nativo Android (configuração e build)
├── ios/                      # Código nativo iOS
├── linux/                    # Suporte ao Linux
├── macos/                    # Suporte ao macOS
├── windows/                  # Suporte ao Windows
├── web/                      # Versão web do app
│
├── assets/                   # Imagens e recursos estáticos
│       flutter_01.png
│       flutter_02.png
│
├── pubspec.yaml              # Configuração do projeto e dependências Flutter
├── pubspec.lock              # Lockfile das dependências
├── analysis_options.yaml     # Regras de lint e análise estática
├── .gitignore                # Arquivos ignorados pelo Git
└── README.md                 # Documentação do projeto
```

---

## 💡 Autor

**Marcel Fernando Finavaro** 
Desenvolvimento de Sistemas Movéis
📍 Canoas – RS 🇧🇷

> Projeto desenvolvido com **Flutter 3.9.2**
