import axios from 'axios';

// URL base do servidor back-end
const baseURL = 'http://localhost:3000'; // Use a mesma porta definida no back-end

// Função para buscar os usuários do servidor
export const getUsers = async () => {
  try {
    const response = await axios.get(`${baseURL}/users`);

    // Retorne os dados recebidos do servidor
    return response.data;
  } catch (error) {
    // Se ocorrer algum erro, imprima-o no console
    console.error('Erro ao buscar usuários:', error);
    throw error; // Você pode lidar com o erro de outra forma, se desejar
  }
};

// Função para buscar as atividades do servidor
export const getActivities = async () => {
  try {
    // Faça uma solicitação GET para a rota '/activities' no servidor
    const response = await axios.get(`${baseURL}/activities`);

    // Retorne os dados recebidos do servidor
    return response.data;
  } catch (error) {
    console.error('Erro ao buscar atividades:', error);
    throw error; // Você pode lidar com o erro de outra forma, se desejar
  }
};

// Função para buscar as entregas do servidor
export const getDeliveries = async () => {
  try {
    // Faça uma solicitação GET para a rota '/deliveries' no servidor
    const response = await axios.get(`${baseURL}/deliveries`);

    // Retorne os dados recebidos do servidor
    return response.data;
  } catch (error) {
    // Se ocorrer algum erro, imprima-o no console
    console.error('Erro ao buscar entregas:', error);
    throw error; // Você pode lidar com o erro de outra forma, se desejar
  }
};

// Exemplo de uso das funções
getUsers()
  .then(users => {
    console.log('Usuários:', users);
  })
  .catch(error => {
    console.error('Erro ao buscar usuários:', error);
  });

getActivities()
  .then(activities => {
    console.log('Atividades:', activities);
  })
  .catch(error => {
    console.error('Erro ao buscar atividades:', error);
  });

getDeliveries()
  .then(deliveries => {
    console.log('Entregas:', deliveries);
  })
  .catch(error => {
    console.error('Erro ao buscar entregas:', error);
  });
