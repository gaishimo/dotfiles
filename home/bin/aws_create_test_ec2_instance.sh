 aws ec2 run-instances \
   --image-id ami-1431a214 \
   --key-name gaishimo-private \
   --security-group-ids sg-d093d7b5 \
   --instance-type t2.micro \
   --monitoring Enabled=false \
   --no-ebs-optimized \
   --count 1 \
   --instance-initiated-shutdown-behavior terminate

