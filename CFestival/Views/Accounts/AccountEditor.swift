//
//  ProfileEditor.swift
//  CFestival
//
//  Created by zhashut on 2022/6/17.
//

import SwiftUI

struct AccountEditor: View {
    @Binding var profile: Profile
    @EnvironmentObject var modelData: ModelData
    @State var selectImage: UIImage?
    @State var isShowAlert: Bool = false
    @State var showImagePickerView: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .camera

  var dateRange: ClosedRange<Date> {
      let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
      let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
      return min...max
  }

    var body: some View {
      List {
        HStack {
          Text("Username").bold()
          Divider()
          TextField("Username", text: $profile.username)
        }
          
        HStack {
              Text("Photo")
                  .font(.headline)
              Divider()
              Spacer()
            Button {
                isShowAlert.toggle()
            } label: {
                if let selectImage = selectImage {
                    Image(uiImage: selectImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 50)
                        .clipShape(Circle())
                } else {
                    Image(uiImage: modelData.profiles.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        .clipShape(Circle())
                }
            }              
        }
        .sheet(isPresented: $showImagePickerView) {
            ImagePickerControllerView(sourceType: self.sourceType) { uiImage in
                selectImage = uiImage
                profile.photo = selectImage!
            }
        }
        .confirmationDialog("选择图片", isPresented: $isShowAlert) {
            Button {
                if ImagePickerControllerView.cameraAviable() {
                    self.sourceType = .camera
                    showImagePickerView.toggle()
                }
            } label: {
                Text("拍照")
            }

            Button {
                self.sourceType = .photoLibrary
                showImagePickerView.toggle()
            } label: {
                Text("图片库")
            }

            Button(role: ButtonRole.cancel) {
                isShowAlert = false
            } label: {
                Text("取消")
            }
        }

        HStack {
          Text("Location").bold()
          Divider()
          TextField("Location", text: $modelData.profiles.location)
          Spacer()
          LocationView()
        }

        ColorPicker("BackgroundColor", selection: $profile.bgColor)
              .font(.headline)

        DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
            Text("Goal Date").bold()
        }
      }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
      AccountEditor(profile: .constant(.default))
            .environmentObject(ModelData())
    }
}
