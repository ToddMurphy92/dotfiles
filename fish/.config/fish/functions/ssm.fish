function ssm
    aws ssm start-session --target $argv[1]
end
