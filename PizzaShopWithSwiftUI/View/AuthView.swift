//
//  ContentView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 02.03.2022.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    @State private var email = ""
    @State private var password = ""
    @State private var confimPassword = ""
    @State private var isTableViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text(isAuth ?"Авторизация" : "Регистрация")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlfa"))
                .cornerRadius(isAuth ? 30 : 60)
            
            VStack {
                TextField("Введите Email", text: $email)
                    .padding()
                    .background(Color("whiteAlfa"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlfa"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                if !isAuth {
                    SecureField("Повторите пароль", text: $confimPassword)
                        .padding()
                        .background(Color("whiteAlfa"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Авторизация")
                        AuthService.shared.signIn(email: self.email, password: self.password) { result in
                            switch result {
                                
                            case .success(_):
                                isTableViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                                isShowAlert.toggle()
                            }
                        }
                        
                       
                    } else {
                        
                        guard password == confimPassword else {
                            self.alertMessage = "Пароли не совпадают!"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        print("Регистрация")
                        AuthService.shared.signUP(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(let user):
                                alertMessage = "Вы зарегистрировались с email \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confimPassword = ""
                                self.isAuth.toggle()
                                
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }
                        
                        
                        
                    }
                   
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color("darkBrown"))
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Еще не с нами?" : "Уже есть аккаунт")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color("darkBrown"))
                        
                }
            }
            .padding()
            .padding(.top, 16)
            .background(Color("whiteAlfa"))
            .cornerRadius(24)
            .padding(isAuth ? 30 : 12)
            .alert(alertMessage, isPresented: $isShowAlert) {
                Button {
                } label: {
                    Text("OK")
                }

            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("bg"))
            .ignoresSafeArea()
            //.blur(radius: isAuth ? 0 : 6)
        
            .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTableViewShow) {
                
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                MainTabBar(viewModel: mainTabBarViewModel)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
