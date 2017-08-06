# RSA-key based login

APPLICATION: Log into an SSH session using an RSA key instead of a regular password for more security and/or privacy (or even convenience).

1. Open the authorized_keys file for editing on the server side:

    ```
    $ vim /home/username/.ssh/authorized_keys
    ```

3. Populate it with the *public* RSA-keys you wish to grand system access (replace the following with your keys):

    ```shell
    <ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDIYPme3EYXldsqUnV8l6+L3ObnEphusSM3Xs8GxjMxVHVd1Lo5LUi949SR7onsVKN+ac7A5CuZHA5cT0FEjIVTa31mrasdaId3gItyPqh+bV+RAcGmqo4VefQdAr1asdaRHl1Kb6wnVXWRMLpCyw5I3N3v4i1tXLm3SWvEVwIgh8Pjtjrtjr3Nyo+tOfus3kTwRWOvDfVHguhrV8dfgHLT8X+kWPzxJWIn/pL/Mvu6LhKslXhuGU/xnsda7sNiJWFK8QPQ5zvKRE06DOD1ba+nY7SAKLHjjxq4wltQttXoPtlMjg0KA1TTTePsLeVfVq/a4ERHFpr2ZsWdsrfhUzrqvyGv4CvaN4t14t5Dvn6x45e2YEtsBsdafrhwK6DQ9q8+ya1DtEaZadgCAofwEtBhHyDm9rRo4rB7sjd65uJBwO1bF93sSv1RldfdlTMuNsf9hxQnmIUVl+drl/unyKzagT7p2K47nt55Q8P6DcsdFvCsddF2m+IHt5n+3bCzQD58McaFHAt29DDhRkjyB3SQI26wk5jrtj+pW2G+YuDmesfgjAXumj50W/YL6tHsppqKNNQky7HpljxSjQ49dqxSymZ89b97k2FcNdOHasdYorarcIMJt9kFYezxYjYWqbFnrt5uZ0674W435uZgJ+M7br5tg84f3weddwx5efkrg6h7ig4osKbPTAMJz67d+6z/lHXVg7YadrZDYjR1uZQ9b5XBpgmuZIasdNQ/aeH9FYNoLUjkxghjNfttbuw54JwqF4bzSEzcKJHGwyjroaskdfg0r7i0ISs/kD5j7EpGo1gHdtf4bp7C5Vo6qT8ix6eu3aUZucyc1n+E36aZdA2v1y66D8Dfs+dSwMsdSTQ+Kz5CIF8CiBsEiECCcecEnHW1xGXQgARtj+MUyAA3cl4NT0Ee7YpD7Jpaft7jc56rgR67gjk9ilC656yhecvwdzwu5PjxV8b54b3bba457bd45bg2346A2346xb877P77qM4HsSohhqaa6XdM3H3lV3kgrdfd4sbRNRWh1px6pCT9j6T7j8csQ6fO7UFlCZ6aIxoanvMQXbof56SzDimikVmHWDydwU5LmpajdDoasH8VSnmJ9gF0SBiwdIDyjNyl3Ptpe7s42d1Y32DA9nDBRq2f6kT8krbHsXIsj7vryemVt4aK9Te3ni6U33kCuMlN/6fL04V7+hWMkTFP33oe2EWwuaOQwkq1qCobS+woLOzuLnF0Rhj7+YWGLyI2TdLpjJd8J4XshTSQIskju6PsG+8+ZUi2Toqm7FFiTwVKZuxS7JPglSLAdasdakAaNZkA5gSg/w11Pk6M5t0RQIyq1NgBPPXitBnFs0d3kKs2hmz user@host>
    ```

5. Instruct your ssh client (e.g. putty on Windows) to use the corresponding private key when connecting to the container.

6. Connect via ssh using the user's account (not root; you can `su` to super user from within the container if required).
