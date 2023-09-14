platform :ios, '16.4'

target 'Planet_uiKit' do
  
  use_frameworks!
  
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SDWebImage'
  
  target 'Planet_uiKitTests' do
    inherit! :search_paths
    
  end
  
  target 'Planet_uiKitUITests' do
    
  end
  
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.4'
      end
    end
  end
end
