Pod::Spec.new do |s|
  s.name         = "RSFunLoading"
  s.version      = "0.0.1"
  s.summary      = "A fun loading that shows above some controller."

  s.description  = <<-DESC
  This fun loading was made for devs who want to add a different loading funcionallity. The loading view animates above some controller, shadowing the content and locking the user interaction. You just need two lines to show it and one line to hide it.
                   DESC

  s.homepage     = "https://github.com/sampaioroberto/RSFunLoading"
  
  s.license      = "MIT"

  s.author             = { "Roberto Sampaio" => "ssampaio.roberto@gmail.com" }
  
  s.platform     = :ios, "10.0"
  
  s.source       = { :git => "https://github.com/sampaioroberto/RSFunLoading", :tag => "1.0.0" }

  s.source_files  = "RSFunLoading", "RSFunLoading/**/*.{h,m,swift}"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
