//
//  ProfileView.swift
//  PizzaShopWithSwiftUI
//
//  Created by MacBookPro on 05.03.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @State var name: String = "Имя Фамилия"
    @State var phone: Int = 3745298839022
    @State var adress: String = "Ваш адресс будет тут"
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
        
        HStack(spacing: 16) {
            Image("user")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(8)
                .background(Color("lightGray"))
                .clipShape(Circle())
                .onTapGesture {
                    isAvaAlertPresented.toggle()
                }
                .confirmationDialog("Откуда взять фотку", isPresented: $isAvaAlertPresented) {
                    Button {
                        print("Library")
                    } label: {
                        Text("Из галереи")
                    }
                    
                    Button {
                        print("Camera")
                    } label: {
                        Text("Из камеры")
                    }
                    
                }
            
            VStack(alignment: .leading, spacing: 12) {
                TextField("Имя", text: $name)
                    .font(.body.bold())
                HStack{
                    Text("+7")
                    TextField("Телефон", value: $phone, format: .number)
                }
                
            }
        }
            
            VStack(alignment: .leading, spacing: 2) {
            Text("Адрес доставки: ")
                .bold()
                TextField("Ваш адрес", text: $adress)
            }
            
            List{
                Text("Ваши заказы будут тут")
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.padding()
                .confirmationDialog("Действительно выйти?", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }

                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
