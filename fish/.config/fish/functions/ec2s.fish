# Defined in /home/bryan/.config/fish/functions/ec2s.fish @ line 1
function ec2s
    aws ec2 describe-instances \
        --query "
        sort_by(
          Reservations[].Instances[].[
            InstanceId,
            PrivateIpAddress,
            Tags[?Key=='Name'].Value | [0] || '',
            Tags[?Key=='srg:function'].Value | [0] || ''
          ],
          &[2]
        )" \
        --output table
end
